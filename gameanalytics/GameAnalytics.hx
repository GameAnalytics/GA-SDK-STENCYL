package;

#if cpp
        import cpp.Lib;
#elseif neko
        import neko.Lib;
#else
        #if android
                import openfl.Lib;
        #end
#end

#if openfl_legacy
import openfl.utils.JNI;
#else
import lime.system.JNI;
#end

class GameAnalytics {
  //versioning
  private static inline var sdk_version:String = "1.0.0"; //GameAnalytics SDK version

  //Settings cache
  private static var gameKey:String;
  private static var secretKey:String;
  private static var user_id:String;
  private static var build:String;
  private static var enableVerboseB:Bool;
  private static var enableInfoB:Bool;
  private static var gender:String;
  private static var birthYear:Int;

  //Custom dimensions
  private static var customDimensions01:String; //configured before initialisation
  private static var customDimensions02:String; //configured before initialisation
  private static var customDimensions03:String; //configured before initialisation
  private static var customDimension:String; //used in all setters

  //Events cache

  //common param
  private static var amount:Float; //shared by design and resource events
  private static var itemType:String; //shared by design and business events
  private static var itemId:String; //shared by design and business events
  private static var currency:String; //shared by business and resource events

  //design
  private static var designEventId:String;
  //business
  private static var cartType:String;
  private static var receipt:String;
  private static var store:String;
  private static var signature:String;
  private static var amountInCents:Int;
  //resource
  private static var currencies:String; //configured before initialisation
  private static var itemTypes:String; //configured before initialisation
  private static var flowType:Int;
  //progression
  private static var progression01:String;
  private static var progression02:String;
  private static var progression03:String;
  private static var status:Int;
  private static var score:Int;
  //error
  private static var severity:Int;
  private static var message:String;

        #if ios
                private static var initGA = Lib.load("gameanalytics", "initGA", 2);
                private static var enableVerboseGA = Lib.load("gameanalytics","enableVerboseGA",1);
                private static var enableInfoGA = Lib.load("gameanalytics","enableInfoGA",1);
                private static var configureUserIdGA = Lib.load("gameanalytics","configureUserIdGA",1);
                private static var configureBuildGA = Lib.load("gameanalytics","configureBuildGA",1);
                private static var configureAvailableResourceCurrenciesGA = Lib.load("gameanalytics","configureAvailableResourceCurrenciesGA",1);
                private static var configureAvailableResourceItemTypesGA = Lib.load("gameanalytics","configureAvailableResourceItemTypesGA",1);
                private static var configureAvailableCustomDimensions01GA = Lib.load("gameanalytics","configureAvailableCustomDimensions01GA",1);
                private static var configureAvailableCustomDimensions02GA = Lib.load("gameanalytics","configureAvailableCustomDimensions02GA",1);
                private static var configureAvailableCustomDimensions03GA = Lib.load("gameanalytics","configureAvailableCustomDimensions03GA",1);
                private static var setCustomDimension01GA = Lib.load("gameanalytics","setCustomDimension01",1);
                private static var setCustomDimension02GA = Lib.load("gameanalytics","setCustomDimension02",1);
                private static var setCustomDimension03GA = Lib.load("gameanalytics","setCustomDimension03",1);
                private static var setGenderGA = Lib.load("gameanalytics","setGenderGA",1);
                private static var setBirthYearGA = Lib.load("gameanalytics","setBirthYearGA",1);

                //events
                private static var addDesignEventGA = Lib.load("gameanalytics","addDesignEventGA",1);
                private static var addDesignEventWithAmountGA = Lib.load("gameanalytics","addDesignEventWithAmountGA",2);
                private static var setBusinessEventStringsGA = Lib.load("gameanalytics","setBusinessEventStrings",5);
                private static var setBusinessEventIntGA = Lib.load("gameanalytics","setBusinessEventInteger",1);
                private static var addBusinessEventGA = Lib.load("gameanalytics","addBusinessEventGA",0);
                private static var addResourceEventGA = Lib.load("gameanalytics","addResourceEventGA",5);
                private static var addProgressionEventGA = Lib.load("gameanalytics","addProgressionEventGA",5);
                private static var addErrorEventGA = Lib.load("gameanalytics","addErrorEventGA",2);

                //State
                private static var configureSdkVersionGA = Lib.load("gameanalytics","configureSdkVersionGA",1);
                private static var configureEngineVersionGA = Lib.load("gameanalytics","configureEngineVersionGA",1);

                //Manual session handling
                private static var setEnabledManualSessionHandlingGA = Lib.load("gameanalytics","setEnabledManualSessionHandlingGA",0);
                private static var startSessionGA = Lib.load("gameanalytics","startSessionGA",0);
                private static var endSessionGA = Lib.load("gameanalytics","endSessionGA",0);

                //utility
                private static var printGA = Lib.load("gameanalytics","printGA",1);



        #end
                #if android
                private static var initGA:Dynamic;
                private static var enableVerboseGA:Dynamic;
                private static var enableInfoGA:Dynamic;
                private static var configureUserIdGA:Dynamic;
                private static var configureBuildGA:Dynamic;
                private static var configureAvailableResourceCurrenciesGA:Dynamic;
                private static var configureAvailableResourceItemTypesGA:Dynamic;
                private static var configureAvailableCustomDimensions01GA:Dynamic;
                private static var configureAvailableCustomDimensions02GA:Dynamic;
                private static var configureAvailableCustomDimensions03GA:Dynamic;
                private static var setCustomDimension01GA:Dynamic;
                private static var setCustomDimension02GA:Dynamic;
                private static var setCustomDimension03GA:Dynamic;
                private static var setGenderGA:Dynamic;
                private static var setBirthYearGA:Dynamic;

                //events
                private static var addDesignEventGA:Dynamic;
                private static var addDesignEventWithAmountGA:Dynamic;
                private static var addBusinessEventGA:Dynamic;
                private static var addResourceEventGA:Dynamic;
                private static var addProgressionEventGA:Dynamic;
                private static var addErrorEventGA:Dynamic;

                //State
                private static var configureSdkVersionGA:Dynamic;
                private static var configureEngineVersionGA:Dynamic;

                //Manual session handling
                private static var setEnabledManualSessionHandlingGA:Dynamic;
                private static var startSessionGA:Dynamic;
                private static var endSessionGA:Dynamic;
                #end
                #if cpp
                #end
                #if mac

                #end

  public static function initialiseiOS(gameKey:String, secretKey:String)
  {
    GameAnalytics.gameKey = gameKey;
    GameAnalytics.secretKey = secretKey;
    initialiseWithGameKeyiOS();
  }

  public static function initialiseAndroid(gameKey:String, secretKey:String)
  {
    GameAnalytics.gameKey = gameKey;
    GameAnalytics.secretKey = secretKey;
    initialiseWithGameKeyAndroid();
  }

  private static function initialiseWithGameKeyiOS()
  {
    configureSdkVersion();
    configureEngineVersion();

    #if(cpp && mobile && !android)
    initGA(gameKey,secretKey);
    #end
  }

  private static function initialiseWithGameKeyAndroid()
  {
    configureSdkVersion();
    configureEngineVersion();

    #if android
    if(initGA == null)
    {
      initGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "initialise", "(Ljava/lang/String;Ljava/lang/String;)V", true);
    }

    initGA([gameKey, secretKey]);
    #end
  }

  public static function enableVerbose(enableVerboseB:Bool)
  {
    GameAnalytics.enableVerboseB = enableVerboseB;
    enableVerboseLog();
  }

  private static function enableVerboseLog()
  {
    #if(cpp && mobile && !android)
    enableVerboseGA(enableVerboseB);
    #end
    #if android
    enableVerboseGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics","enableVerboseLog", "(Ljava/lang/String;)V", true);
    if(enableVerboseB)
    {
    enableVerboseGA(["true"]);
    }
    else
    {
    enableVerboseGA(["false"]);
    }
    #end
  }

  public static function enableInfo(enableInfoB:Bool)
  {
    GameAnalytics.enableInfoB = enableInfoB;
    enableInfoLog();
  }

  private static function enableInfoLog()
  {
  #if(cpp && mobile && !android)
  enableInfoGA(enableInfoB);
  #end
  #if android
  enableInfoGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "enableInfoLog", "(Ljava/lang/String;)V", true);
  if(enableInfoB)
  {
  enableInfoGA(["true"]);
  }
  else
  {
  enableInfoGA(["false"]);
  }
  #end
  #if mac
  trace("We are on mac!");
  #end
  }

  public static function configureUserId(user_id:String)
  {
  GameAnalytics.user_id = user_id;
  configUserId();
  }

  private static function configUserId()
  {
  #if(cpp && mobile && !android)
  configureUserIdGA(user_id);
  #end
  #if android
  configureUserIdGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configUserId", "(Ljava/lang/String;)V", true);
  configureUserIdGA([user_id]);
  #end
  }

  public static function configureiOS(build:String)
  {
    GameAnalytics.build = build;
    configBuildiOS();
  }

  public static function configureAndroid(build:String)
  {
    GameAnalytics.build = build;
    configBuildAndroid();
  }

  private static function configBuildiOS()
  {
  #if(cpp && mobile && !android)
  configureBuildGA(build);
  #end
  }

  private static function configBuildAndroid()
  {
  #if android
  configureBuildGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureBuild", "(Ljava/lang/String;)V", true);
  configureBuildGA([build]);
  #end
  }

  public static function configureAvailableResourceCurrencies(_currencies:String)
  {
    GameAnalytics.currencies = _currencies;
    availableResourceCurrencies();
  }

  private static function availableResourceCurrencies()
  {
  #if(cpp && mobile && !android)
  configureAvailableResourceCurrenciesGA(currencies);
  #end
  #if android
  configureAvailableResourceCurrenciesGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureAvailableResourceCurrencies", "(Ljava/lang/String;)V", true);
  configureAvailableResourceCurrenciesGA([currencies]);
  #end
  }

  public static function configureAvailableResourceItemTypes(_itemTypes:String)
  {
  GameAnalytics.itemTypes = _itemTypes;
  availableResourceItemTypes();
  }

  private static function availableResourceItemTypes()
  {
  #if(cpp && mobile && !android)
  configureAvailableResourceItemTypesGA(itemTypes);
  #end
  #if android
  configureAvailableResourceItemTypesGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureAvailableResourceItemTypes", "(Ljava/lang/String;)V", true);
  configureAvailableResourceItemTypesGA([itemTypes]);
  #end
  }

  public static function configureAvailableCustomDimensions01(customDim:String)
  {
  GameAnalytics.customDimensions01 = customDim;
  availableCustomDimensions01();
  }

  private static function availableCustomDimensions01()
  {
  #if(cpp && mobile && !android)
  configureAvailableCustomDimensions01GA(customDimensions01);
  #end
  #if android
  configureAvailableCustomDimensions01GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions01", "(Ljava/lang/String;)V", true);
  configureAvailableCustomDimensions01GA([customDimensions01]);
  #end
  }

  public static function configureAvailableCustomDimensions02(customDim:String)
  {
  GameAnalytics.customDimensions02 = customDim;
  availableCustomDimensions02();
  }

  private static function availableCustomDimensions02()
  {
  #if(cpp && mobile && !android)
  configureAvailableCustomDimensions02GA(customDimensions02);
  #end
  #if android
  configureAvailableCustomDimensions02GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions02", "(Ljava/lang/String;)V", true);
  configureAvailableCustomDimensions02GA([customDimensions02]);
  #end
  }

  public static function configureAvailableCustomDimensions03(customDim:String)
  {
  GameAnalytics.customDimensions03 = customDim;
  availableCustomDimensions03();
  }

  private static function availableCustomDimensions03()
  {
  #if(cpp && mobile && !android)
  configureAvailableCustomDimensions03GA(customDimensions03);
  #end
  #if android
  configureAvailableCustomDimensions03GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureAvailableCustomDimensions03", "(Ljava/lang/String;)V", true);
  configureAvailableCustomDimensions03GA([customDimensions03]);
  #end
  }

  public static function setCustomDimension01(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim01();
  }

  private static function setCustomDim01()
  {
  #if(cpp && mobile && !android)
  setCustomDimension01GA(customDim);
  #end
  #if android
  setCustomDimension01GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "setCustomDimension01", "(Ljava/lang/String;)V", true);
  setCustomDimension01GA([customDim]);
  #end
  }

  public static function setCustomDimension02(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim02();
  }

  private static function setCustomDim02()
  {
  #if(cpp && mobile && !android)
  setCustomDimension02GA(customDim);
  #end
  #if android
  setCustomDimension02GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "setCustomDimension02", "(Ljava/lang/String;)V", true);
  setCustomDimension02GA([customDim]);
  #end
  }

  public static function setCustomDimension03(customDim:String)
  {
    GameAnalytics.customDimension = customDim;
    setCustomDim03();
  }

  private static function setCustomDim03()
  {
  #if(cpp && mobile && !android)
  setCustomDimension03GA(customDim);
  #end
  #if android
  setCustomDimension03GA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "setCustomDimension03", "(Ljava/lang/String;)V", true);
  setCustomDimension03GA([customDim]);
  #end
  }

  public static function setGender(gender:String)
  {
  GameAnalytics.gender = gender;
  genderGA();
  }

  private static function genderGA()
  {
  #if(cpp && mobile && !android)
  setGenderGA(gender);
  #end
  #if android
  setGenderGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "setGender", "(I)V", true);
  if(gender == "male")
  {
  setGenderGA([1]);
  }
  else if(gender == "female")
  {
  setGenderGA([2]);
  }
  else
  {
  setGenderGA([0]);
  }
  #end
  }

  public static function setBirthYear(birthYear:Int)
  {
  GameAnalytics.birthYear = birthYear;
  birthYearGA();
  }

  private static function birthYearGA()
  {
  #if(cpp && mobile && !android)
  setBirthYearGA(birthYear);
  #end
  #if android
  setBirthYearGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "setBirthYear", "(I)V", true);
  setBirthYearGA([birthYear]);
  #end
  }

  //events
  public static function sendDesignEvent(eventId:String)
  {
  GameAnalytics.designEventId = eventId;
  designEvent();
  }

  private static function designEvent()
  {
  #if(cpp && mobile && !android)
  addDesignEventGA(designEventId);
  #end
  #if android
  if(addDesignEventGA == null)
  {
  addDesignEventGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addDesignEventWithEventId", "(Ljava/lang/String;)V", true);
  }
  addDesignEventGA([designEventId]);
  #end
  }

  public static function sendDesignEventWithAmount(eventId:String, amount:Float)
  {
  GameAnalytics.designEventId = eventId;
  GameAnalytics.amount = amount;
  designEventWithAmount();
  }

  private static function designEventWithAmount()
  {
  #if(cpp && mobile && !android)
  addDesignEventWithAmountGA(designEventId, amount);
  #end
  #if android
  if(addDesignEventWithAmountGA == null)
  {
  addDesignEventWithAmountGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addDesignEventWithAmountGA", "(Ljava/lang/String;F)V", true);
  }
  var args:Array<Dynamic> = [designEventId, amount];
  addDesignEventWithAmountGA(args);
  #end
  }

  public static function sendBusinessEventIOS(currency:String, amountInCents:Int, itemType:String, itemId:String, cartType:String, receipt:String)
  {
  GameAnalytics.currency = currency;
  GameAnalytics.amountInCents = amountInCents;
  GameAnalytics.itemType = itemType;
  GameAnalytics.itemId = itemId;
  GameAnalytics.cartType = cartType;
  GameAnalytics.receipt = receipt;
  businessEvent();
  }

  public static function sendBusinessEventAndroid(currency:String, amountInCents:Int, itemType:String, itemId:String, cartType:String, receipt:String, signature:String)
  {
  GameAnalytics.currency = currency;
  GameAnalytics.amountInCents = amountInCents;
  GameAnalytics.itemType = itemType;
  GameAnalytics.itemId = itemId;
  GameAnalytics.cartType = cartType;
  GameAnalytics.receipt = receipt;
  GameAnalytics.signature = signature;
  businessEvent();
  }

  private static function businessEvent()
  {
  #if(cpp && mobile && !android)
  setBusinessEventStringsGA(currency,itemType,itemId,cartType,receipt);
  setBusinessEventIntGA(amountInCents);
  addBusinessEventGA();
  #end
  #if android
  addBusinessEventGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addBusinessEvent",
   "(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
    true);
  var args:Array<Dynamic> = [currency, amountInCents, itemType, itemId, cartType, receipt, signature];
  addBusinessEventGA(args);
  #end
  }

  public static function sendResourceEvent(flowType:Int, currency:String, amount:Int, itemType:String, itemId:String)
  {
  GameAnalytics.flowType = flowType;
  GameAnalytics.currency = currency;
  GameAnalytics.amount = amount;
  GameAnalytics.itemType = itemType;
  GameAnalytics.itemId = itemId;
  resourceEvent();
  }

  private static function resourceEvent()
  {
  #if(cpp && mobile && !android)
  addResourceEventGA(flowType, currency, amount, itemType, itemId);
  #end
  #if android
  addResourceEventGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addResourceEvent", "(ILjava/lang/String;FLjava/lang/String;Ljava/lang/String;)V", true);
  var args:Array<Dynamic> = [flowType, currency, amount, itemType, itemId];
  addResourceEventGA(args);
  #end
  }

  public static function sendProgressionEventWithOneProgressions(status:Int, progression01:String, score:Int)
  {
  GameAnalytics.status = status;
  GameAnalytics.progression01 = progression01;
  GameAnalytics.progression02 = GameAnalytics.progression03 = "empty";
  GameAnalytics.score = score;
  progressionEvent();
  }

  public static function sendProgressionEventWithTwoProgressions(status:Int, progression01:String, progression02:String, score:Int)
  {
  GameAnalytics.status = status;
  GameAnalytics.progression01 = progression01;
  GameAnalytics.progression02 = progression02;
  GameAnalytics.progression03 = "empty";
  GameAnalytics.score = score;
  progressionEvent();
  }

  public static function sendProgressionEventWithThreeProgressions(status:Int, progression01:String, progression02:String, progression03:String, score:Int)
  {
  GameAnalytics.status = status;
  GameAnalytics.progression01 = progression01;
  GameAnalytics.progression02 = progression02;
  GameAnalytics.progression03 = progression03;
  GameAnalytics.score = score;
  progressionEvent();
  }

  private static function progressionEvent()
  {
  #if(cpp && mobile && !android)
  addProgressionEventGA(status, progression01, progression02, progression03, score);
  #end
  #if android
  addProgressionEventGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addProgressionEvent", "(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V", true);
  var args:Array<Dynamic> = [status, progression01, progression02, progression03, score];
  addProgressionEventGA(args);
  #end
  }

  public static function sendErrorEvent(severity:Int, message:String)
  {
  GameAnalytics.severity = severity;
  GameAnalytics.message = message;
  errorEvent();
  }

  private static function errorEvent()
  {
  #if(cpp && mobile && !android)
  addErrorEventGA(severity, message);
  #end
  #if android
  addErrorEventGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "addErrorEventWithSeverity", "(ILjava/lang/String;)V", true);
  var args:Array<Dynamic> = [severity, message];
  addErrorEventGA(args);
  #end
  }

  // SDK state
  private static function configureSdkVersion()
  {
  var _version:String = "stencyl " + sdk_version;
  #if(cpp && mobile && !android)
  configureSdkVersionGA(_version);
  #end
  #if android
  configureSdkVersionGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureSdkGameEngineVersion", "(Ljava/lang/String;)V", true);
  configureSdkVersionGA([_version]);
  #end
  }

  private static function configureEngineVersion()
  {
  var engineVersion:String;

  #if(openfl >= "4.0.0")
  engineVersion = "stencyl 3.5.0";
  #elseif ((openfl >= "3.3.8") && (openfl < "4.0.0"))
  engineVersion = "stencyl 3.4.0";
  #elseif ((openfl >= 3.3.2) && (openfl < "3.3.8"))
  engineVersion = "stencyl 3.3.2";
  #else
  engineVersion = "stencyl 3.2.0";
  #end

  #if(cpp && mobile && !android)
  configureEngineVersionGA(engineVersion);
  #end
  #if android
  configureEngineVersionGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "configureGameEngineVersion", "(Ljava/lang/String;)V", true);
  configureEngineVersionGA([engineVersion]);
  #end
  }

  //Manual session handling
  public static function setEnableManualSessionHandling()
  {
  #if(cpp && mobile && !android)
  setEnabledManualSessionHandlingGA();
  #end
  #if android
  setEnabledManualSessionHandlingGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "enableManualSessionHandling", "()V", true);
  setEnabledManualSessionHandlingGA();
  #end
  }

  public static function startSession()
  {
  #if(cpp && mobile && !android)
  startSessionGA();
  #end
  #if android
  startSessionGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "enableManualSessionHandling", "()V", true);
  startSessionGA();
  #end
  }

  public static function endSession()
  {
  #if(cpp && mobile && !android)
  endSessionGA();
  #end
  #if android
  endSessionGA = JNI.createStaticMethod("com/gameanalytics/MyGameAnalytics", "startSession", "()V", true);
  endSessionGA();
  #end
  }

  //Utility
  private static function printMessage(message:String)
  {
  #if(cpp && mobile && !android)
  printGA(message);
  #end
  }
}
