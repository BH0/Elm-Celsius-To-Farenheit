{- Useful: 
 * https://elm-lang.org/docs/from-javascript 
 * https://guide.elm-lang.org 
-} 

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (placeholder, value, size) 
import Html.Events exposing (onInput)

-- MAIN 
main =
   Browser.sandbox { init = init, update = update, view = view}

-- MODEL 
type alias Model = 
    { value: Float   
    }

init : Model 
init = 
    { value = 0.0 }

-- UPDATE 
type Msg =
    AsCelsisus String

update: Msg -> Model -> Model 
update msg model =
    case msg of 
        AsCelsisus valAsCel -> 
            { model | value = convertToFarenheit (String.toFloat valAsCel |> Maybe.withDefault 0) }

convertToFarenheit : Float -> Float 
convertToFarenheit cel = 
    1.8 * cel + 32  

-- VIEW 
view : Model -> Html Msg
view model =
  div []                                -- value model.value,  
    [ input [ placeholder "enter celisus, receive farenheit equivalent", onInput AsCelsisus, size 40 ] []
    , div [] [ text ( "Celsius: " ++ String.fromFloat model.value ) ]
    ]
