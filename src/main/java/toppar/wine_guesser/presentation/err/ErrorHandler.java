package toppar.wine_guesser.presentation.err;

public class ErrorHandler {

    public static final String USERNAME_FAIL = "Användarnamnet är upptaget, välj ett annat.";
    public static final String AUTHORIZATION_FAIL = "Du har ingen rättighet att besöka sidan.";
    public static final String AUTHORIZATION_LOBBY_FAIL = "Ingen vinprovning matchade koden.";
    public static final String SYSTEMBOLAGET_DOWN = "Systembolaget svarar inte just nu";
    public static final String BODEGASHOP_DOWN = "Bodegashop svarar inte just nu";
    public static final String ERROR_TYPE_KEY = "errorType";
    public static final String TO_BIG_GUESS = "För stort nummer, måste vara 1 till antalet viner som serveras";
    public static final String TO_SMALL_GUESS = "För litet nummer, måste vara 1 till antalet viner som serveras.";
    public static final String GUESS_WRONG_FORMAT = "Fel typ, skriv in en siffra.";
    public static final String MISSING_SERVING_ORDER = "Scanna in serveringsordning!";
    public static final String EMPTY_GUESS = "Kan inte var tom.";
    public static final String WRONG_JUDGEMENT_RANGE = "Betyg måste vara heltal 1 till 5.";
    public static final String SERVING_ORDER_SAME = "Ordningen måste var unik.";
    public static final String SERVING_ORDER_ALREADY_EXIST = "En serveringsordning för detta vin har redan registrerats";
    public static final String SERVING_ORDER_TO_BIG = "Du kan inte skriva in en serveringsordning som är större än antalet viner som serveras.";
    public static final String SERVING_ORDER_TO_SMALL = "Du kan inte skriva in en serveringsordning som är minre än antalet viner som serveras.";
    public static final String SERVING_ORDER_NO_DATA = "Skriv in korrekt serveringsordning.";
    public static final String NO_PROFILE_FOUND = "Ingen sådan profil hittades.";
    public static final String NOT_A_NUM = "Måste vara en siffra!";
    public static final String ALREADY_CLUB_MEMBER = "Du är redan medlem i klubben!";
    public static final String WRONG_CLUB_PASSWORD = "Fel klubblösenord!";
    public static final String WRONG_CLUB_NAME = "Ingen klubb hittades med namnet!";
    public static final String CLUB_NAME_TAKEN = "Klubbnamnet är redan upptaget.";
    public static final String NOT_A_MEMBER_OF_ANY_CLUB = "Du är inte medlem i någon Klubb!";
    public static final String NOT_A_MEMBER_OF_THAT_CLUB = "Du behöver vara medlem för att ha tillgång till klubben!";
    public static final String NOT_ALL_USERS_ARE_IN_THE_CLUB = "Vinprovare har lämnat provningen under spelets gång -ingen klubbstatistik sparas-";
    public static final String YOU_DONT_HAVE_LOBBY_CLUB = "Denna vinprovning kräver medlemmskap i en specifik klubb.";
    public static final String NO_GAME_SETUP = "Något gick fel, gör om och gör rätt!";
    public static final String FAULT_IN_COMMENT = "Du måste skriva något!";
    public static final String LEFT_GAME = "Du lämnade vinprovningen, inga resultat sparades.";
    public static final String GAME_CLOSED = "Vinvärden avslutade vinprovningen, inga resultat sparades.";
    public static final String YOU_CLOSED_GAME = "Du avslutade vinprovningen, inga resultat sparades.";
}
