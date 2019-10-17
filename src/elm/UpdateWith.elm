module UpdateWith exposing (updateWith)

import Model exposing (Model)
import Router exposing (requestRouteChange)
import Signal exposing (Signal(..))


processSignal : Model -> Signal -> Cmd msg
processSignal model signal =
    case signal of
        NoSignal ->
            Cmd.none

        RequestRouteChange route ->
            requestRouteChange model route


updateWith : (subModel -> Model) -> (subMsg -> msg) -> ( subModel, Cmd subMsg, Signal ) -> ( Model, Cmd msg )
updateWith toModel toMsg ( subModel, subCmd, signal ) =
    let
        newModel =
            toModel subModel

        signalCmds =
            processSignal newModel signal

        newCmds =
            Cmd.batch [ signalCmds, Cmd.map toMsg subCmd ]
    in
    ( newModel
    , newCmds
    )
