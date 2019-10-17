module Asset exposing (defaultAvatar, error, image, imageWithFallback, loading, src)

import Html exposing (object, img, Attribute, Html)
import Html.Attributes as Attr


type Image
    = Image String


error : Image
error =
    image "error.png"


loading : Image
loading =
    image "loading.svg"


defaultAvatar : Image
defaultAvatar =
    image "logo.png"


image : String -> Image
image filename =
    Image (localPath filename)


src : Image -> Attribute msg
src (Image url) =
    Attr.src url


localPath : String -> String
localPath =
    (++) "images/"


remotePath : String -> String
remotePath =
    (++) "assets/images/"


imageWithFallback : String -> String -> Html msg
imageWithFallback filename fallback =
    object [ Attr.attribute "data" filename, Attr.attribute "type" "image/png" ]
        [ img [ Attr.src fallback ] []
        ]
