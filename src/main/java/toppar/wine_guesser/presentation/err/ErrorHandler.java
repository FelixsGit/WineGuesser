package toppar.wine_guesser.presentation.err;

public class ErrorHandler {

    public static final String USERNAME_FAIL = "Användarnamnet är redan tagit, välj ett annat.";
    public static final String AUTHORIZATION_FAIL = "Du har inte rättigheter att besöka sidan.";
    public static final String AUTHORIZATION_LOBBY_FAIL = "Ingen lobby matchade koden.";
    public static final String SYSTEMBOLAGET_DOWN = "Systembolaget svarar inte just nu";
    public static final String BODEGASHOP_DOWN = "Bodegashop svarar inte just nu";
    public static final String ERROR_TYPE_KEY = "errorType";
    public static final String TO_BIG_GUESS = "För stort tal, måste vara 1 till antalet viner som serveras";
    public static final String TO_SMALL_GUESS = "För litet tal, måste vara 1 till antalet viner som serveras.";
    public static final String GUESS_WRONG_FORMAT = "Fel typ, skriv in en siffra.";
    public static final String MISSING_SERVING_ORDER = "Blipa in serverings ordning!";
    public static final String EMPTY_GUESS = "Kan inte var tom.";
    public static final String WRONG_JUDGEMENT_RANGE = "Betyg måste vara heltal 1 till 5.";
    public static final String SERVING_ORDER_SAME = "Ordningen måste var unik.";
    public static final String SERVING_ORDER_ALREADY_EXIST = "En serveringsordning för detta vin har redan registrerats";
    public static final String SERVING_ORDER_TO_BIG = "Du kan inte skriva in en serveringsorder som är större än antalet viner som serveras";
    public static final String SERVING_ORDER_TO_SMALL = "Du kan inte skriva in en serveringsorder som är minre än antalet viner som serveras";
    public static final String SERVING_ORDER_NO_DATA = "Skriv in en korrekt serveringsorder";
    public static final String NO_PROFILE_FOUND = "Ingen sådan profil hittades";
    public static final String NOT_A_NUM = "Måste vara en siffra!";


}
