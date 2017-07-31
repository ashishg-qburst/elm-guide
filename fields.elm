module Main exposing (..)

import Html exposing (Attribute, Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Html.beginnerProgram { model = model, update = update, view = view }


type alias Model =
    String


model : Model
model =
    ""


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            newContent


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Enter text to reverse!", onInput Change ] []
        , div [] [ text (String.reverse model) ]
        ]
