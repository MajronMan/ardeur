module Utils.Markdown exposing (customHtmlBlock, customHtmlInline, view)

import Css
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attr
import Markdown.Block as Block exposing (Block(..))
import Markdown.Inline as Inline exposing (Inline(..))


view : String -> Html.Html msg
view =
    Block.parse Nothing
        >> List.map customHtmlBlock
        >> List.concat
        >> Html.article []


customHtmlBlock : Block b i -> List (Html.Html msg)
customHtmlBlock =
    Block.defaultHtml
        Nothing
        (Just customHtmlInline)


customHtmlInline : Inline i -> Html.Html msg
customHtmlInline inline =
    case inline of
        Image url maybeTitle inlines ->
            styled figure
                [ Css.margin (Css.rem 1), Css.displayFlex, Css.flexDirection Css.column, Css.alignItems Css.center ]
                []
                [ styled img
                    [ Css.maxWidth (Css.pct 100) ]
                    [ Attr.alt (Inline.extractText inlines)
                    , Attr.src url
                    , Attr.title (Maybe.withDefault "" maybeTitle)
                    ]
                    []
                , styled figcaption
                    [ Css.textAlign Css.center ]
                    []
                    [ text (Inline.extractText inlines) ]
                ]
                |> toUnstyled

        Link url maybeTitle inlines ->
            a
                [ Attr.href url
                , Attr.title (Maybe.withDefault "" maybeTitle)
                , Attr.target "_blank"
                , Attr.rel "noopener noreferrer"
                ]
                (List.map (fromUnstyled << customHtmlInline) inlines)
                |> toUnstyled

        _ ->
            Inline.defaultHtml (Just customHtmlInline) inline
