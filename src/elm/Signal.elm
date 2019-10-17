module Signal exposing (Signal(..))

import Router.Routes exposing (Route)


type Signal
    = RequestRouteChange Route
    | NoSignal
