module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Html.beginnerProgram { model = model, update = update, view = view }


type alias Model =
    { name : String, password : String, passwordConf : String }


model : Model
model =
    Model "" "" ""


type Msg
    = Name String
    | Password String
    | PasswordConfirmation String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordConfirmation passwordConf ->
            { model | passwordConf = passwordConf }


view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name ] []
        , input [ type_ "password", placeholder "Password", onInput Password ] []
        , input [ type_ "password", placeholder "Password Again", onInput PasswordConfirmation ] []
        , validatePasswordView model
        ]


validatePasswordView : Model -> Html Msg
validatePasswordView model =
    let
        ( color, message ) =
            if model.password == model.passwordConf then
                ( "green", "OK" )
            else
                ( "red", "Passwords should match." )
    in
    div [ style [ ( "color", color ) ] ] [ text message ]
