"use strict";

import { Elm } from "../elm/Main";

var app = Elm.Main.init({
    flags: 6
});

document.addEventListener("DOMContentLoaded", function() {
    if (app.ports && firebase) {
        const {
            getArticle,
            gotArticle,
            listArticles,
            listedArticles
        } = app.ports;
        const articlesRef = firebase
            .storage()
            .ref()
            .child("articles");
        const sendArticle = onload => url => {
            const xhr = new XMLHttpRequest();
            xhr.responseType = "text";
            xhr.onload = onload(xhr);
            xhr.open("GET", url);
            xhr.send();
        };

        getArticle &&
            getArticle.subscribe(name =>
                articlesRef
                    .child(name)
                    .getDownloadURL()
                    .then(
                        sendArticle(xhr => () => gotArticle.send(xhr.response))
                    )
                    .catch(e => {
                        if (e.code_ === "storage/object-not-found") {
                            gotArticle.send(`Article ${name} does not exist.`);
                        }
                    })
            );

        listArticles &&
            listArticles.subscribe(() =>
                articlesRef.listAll().then(({ items }) => {
                    Promise.all(items.map(x => x.getMetadata())).then(r => {
                        listedArticles.send(
                            r
                                .sort((a, b) =>
                                    new Date(a.timeCreated) <=
                                    new Date(b.timeCreated)
                                        ? 1
                                        : -1
                                )
                                .map(x => x.name)
                        );
                    });
                })
            );
    }
});
