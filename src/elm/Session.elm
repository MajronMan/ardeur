module Session exposing (..)

import Browser.Navigation as Nav

type Session = Guest Nav.Key

getKey : Session -> Nav.Key
getKey session =
  case session of
    Guest key -> key
