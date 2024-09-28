/*
 * GLOBAL ROOT (DO NOT CHANGE)
 */
$.root_ = $('body');
/*
 * APP CONFIGURATION (HTML/AJAX/PHP Versions ONLY)
 * Description: Enable / disable certain theme features here
 * GLOBAL: Your left nav in your app will no longer fire ajax calls, set
 * it to false for HTML version
 */
$.navAsAjax = false;
/*
 * GLOBAL: Sound Config (define sound path, enable or disable all sounds)
 */
$.sound_path = "sound/";
$.sound_on = true;
/*
 * SAVE INSTANCE REFERENCE (DO NOT CHANGE)
 * Save a reference to the global object (window in the browser)
 */
var root = this,
    /*
     * DEBUGGING MODE
     * debugState = true; will spit all debuging message inside browser console.
     * The colors are best displayed in chrome browser.
     */
    debugState = false,
    debugStyle = 'font-weight: bold; color: #00f;',
    debugStyle_green = 'font-weight: bold; font-style:italic; color: #46C246;',
    debugStyle_red = 'font-weight: bold; color: #ed1c24;',
    debugStyle_warning = 'background-color:yellow',
    debugStyle_success = 'background-color:green; font-weight:bold; color:#fff;',
    debugStyle_error = 'background-color:#ed1c24; font-weight:bold; color:#fff;',
    /*
     * Impacts the responce rate of some of the responsive elements (lower
     * value affects CPU but improves speed)
     */
    throttle_delay = 350,
    /*
     * The rate at which the menu expands revealing child elements on click
     */
    menu_speed = 235,
    /*
     * Collapse current menu item as other menu items are expanded
     * Careful when using this option, if you have a long menu it will
     * keep expanding and may distrupt the user experience This is best
     * used with fixed-menu class
     */
    menu_accordion = true,
    /*
     * Turn on JarvisWidget functionality
     * Global JarvisWidget Settings
     * For a greater control of the widgets, please check app.js file
     * found within COMMON_ASSETS/UNMINIFIED_JS folder and see from line 1355
     * dependency: js/jarviswidget/jarvis.widget.min.js
     */
    enableJarvisWidgets = true,
    /*
     * Use localstorage to save widget settings
     * turn this off if you prefer to use the onSave hook to save
     * these settings to your datatabse instead
     */
    localStorageJarvisWidgets = true,
    /*
     * Turn off sortable feature for JarvisWidgets
     */
    sortableJarvisWidgets = true,
    /*
     * Warning: Enabling mobile widgets could potentially crash your webApp
     * if you have too many widgets running at once
     * (must have enableJarvisWidgets = true)
     */
    enableMobileWidgets = false,
    /*
     * Turn on fast click for mobile devices
     * Enable this to activate fastclick plugin
     * dependency: js/plugin/fastclick/fastclick.js
     */
    fastClick = false,
    /*
     * SMARTCHAT PLUGIN ARRAYS & CONFIG
     * Dependency: js/plugin/moment/moment.min.js
     *             js/plugin/cssemotions/jquery.cssemoticons.min.js
     *             js/smart-chat-ui/smart.chat.ui.js
     * (DO NOT CHANGE BELOW)
     */
    boxList = [],
    showList = [],
    nameList = [],
    idList = [],
    /*
     * Width of the chat boxes, and the gap inbetween in pixel (minus padding)
     */
    chatbox_config = {
        width: 200,
        gap: 35
    },
    /*
     * These elements are ignored during DOM object deletion for ajax version
     * It will delete all objects during page load with these exceptions:
     */
    ignore_key_elms = ["#header, #left-panel, #right-panel, #main, div.page-footer, #shortcut, #divSmallBoxes, #divMiniIcons, #divbigBoxes, #voiceModal, script, .ui-chatbox"],
    /*
     * VOICE COMMAND CONFIG
     * dependency: js/speech/voicecommand.js
     */
    voice_command = true,
    /*
     * Turns on speech as soon as the page is loaded
     */
    voice_command_auto = false,
    /*
     * 	Sets the language to the default 'en-US'. (supports over 50 languages
     * 	by google)
     *
     *  Afrikaans         ['af-ZA']
     *  Bahasa Indonesia  ['id-ID']
     *  Bahasa Melayu     ['ms-MY']
     *  Català            ['ca-ES']
     *  Čeština           ['cs-CZ']
     *  Deutsch           ['de-DE']
     *  English           ['en-AU', 'Australia']
     *                    ['en-CA', 'Canada']
     *                    ['en-IN', 'India']
     *                    ['en-NZ', 'New Zealand']
     *                    ['en-ZA', 'South Africa']
     *                    ['en-GB', 'United Kingdom']
     *                    ['en-US', 'United States']
     *  Español           ['es-AR', 'Argentina']
     *                    ['es-BO', 'Bolivia']
     *                    ['es-CL', 'Chile']
     *                    ['es-CO', 'Colombia']
     *                    ['es-CR', 'Costa Rica']
     *                    ['es-EC', 'Ecuador']
     *                    ['es-SV', 'El Salvador']
     *                    ['es-ES', 'España']
     *                    ['es-US', 'Estados Unidos']
     *                    ['es-GT', 'Guatemala']
     *                    ['es-HN', 'Honduras']
     *                    ['es-MX', 'México']
     *                    ['es-NI', 'Nicaragua']
     *                    ['es-PA', 'Panamá']
     *                    ['es-PY', 'Paraguay']
     *                    ['es-PE', 'Perú']
     *                    ['es-PR', 'Puerto Rico']
     *                    ['es-DO', 'República Dominicana']
     *                    ['es-UY', 'Uruguay']
     *                    ['es-VE', 'Venezuela']
     *  Euskara           ['eu-ES']
     *  Français          ['fr-FR']
     *  Galego            ['gl-ES']
     *  Hrvatski          ['hr_HR']
     *  IsiZulu           ['zu-ZA']
     *  Íslenska          ['is-IS']
     *  Italiano          ['it-IT', 'Italia']
     *                    ['it-CH', 'Svizzera']
     *  Magyar            ['hu-HU']
     *  Nederlands        ['nl-NL']
     *  Norsk bokmål      ['nb-NO']
     *  Polski            ['pl-PL']
     *  Português         ['pt-BR', 'Brasil']
     *                    ['pt-PT', 'Portugal']
     *  Română            ['ro-RO']
     *  Slovenčina        ['sk-SK']
     *  Suomi             ['fi-FI']
     *  Svenska           ['sv-SE']
     *  Türkçe            ['tr-TR']
     *  български         ['bg-BG']
     *  Pусский           ['ru-RU']
     *  Српски            ['sr-RS']
     *  한국어          ['ko-KR']
     *  中文                            ['cmn-Hans-CN', '普通话 (中国大陆)']
     *                    ['cmn-Hans-HK', '普通话 (香港)']
     *                    ['cmn-Hant-TW', '中文 (台灣)']
     *                    ['yue-Hant-HK', '粵語 (香港)']
     *  日本語                         ['ja-JP']
     *  Lingua latīna     ['la']
     */
    voice_command_lang = 'en-US',
    /*
     * 	Use localstorage to remember on/off (best used with HTML Version
     * 	when going from one page to the next)
     */
    voice_localStorage = true;
/*
 * Voice Commands
 * Defines voice command variables and functions
 */

/*
 * END APP.CONFIG
 */
function waitit(selector) {
    return new Promise(resolve => {
        if (document.querySelector(selector)) {
            return resolve(document.querySelector(selector));
        }

        const observer = new MutationObserver(mutations => {
            if (document.querySelector(selector)) {
                observer.disconnect();
                resolve(document.querySelector(selector));
            }
        });

        // If you get "parameter 1 is not of type 'Node'" error, see https://stackoverflow.com/a/77855838/492336
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    });
}

function fullscreenrecur() {
    waitit('a.button-icon .fa-compress').then((elm) => {
        $('a.button-icon .fa-compress').click(function(e) {
            $(this).closest('.jarviswidget').detach().insertBefore('#jarviswidget-fullscreen-mode')
            $(this).toggle('fa-expand')
            $(this).toggle('fa-compress')
            $('a.button-icon .fa-cog').parent().css('display', '')
            $('a.button-icon .fa-times').parent().css('display', '')
            $('#jarviswidget-fullscreen-mode').css('display', 'none')
            fullscreenrecur()
        })


        interval = setInterval(function() {

            if ($('#jarviswidget-fullscreen-mode').is(':empty')) {
                $('#jarviswidget-fullscreen-mode').remove()
            }

            if ($('#jarviswidget-fullscreen-mode').length == 0) {
                clearInterval(interval);
            }

        }, 1000);


    });
}

$(document).ready(function() {
    fullscreenrecur()
    pageSetUp();

    $("header#header").detach().insertBefore('body>*:first');
    // DO NOT REMOVE : GLOBAL FUNCTIONS!


    /*
     * PAGE RELATED SCRIPTS
     */

    $(".js-status-update a").click(function() {
        var selText = $(this).text();
        var $this = $(this);
        $this.parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
        $this.parents('.dropdown-menu').find('li').removeClass('active');
        $this.parent().addClass('active');
    });



    $.filter_input = $('#filter-chat-list');
    $.chat_users_container = $('#chat-container > .chat-list-body')
    $.chat_users = $('#chat-users')
    $.chat_list_btn = $('#chat-container > .chat-list-open-close');
    $.chat_body = $('#chat-body');

    /*
     * LIST FILTER (CHAT)
     */

    // custom css expression for a case-insensitive contains()
    jQuery.expr[':'].Contains = function(a, i, m) {
        return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
    };

    function listFilter(list) { // header is any element, list is an unordered list
        // create and add the filter form to the header

        $.filter_input.change(function() {
            var filter = $(this).val();
            if (filter) {
                // this finds all links in a list that contain the input,
                // and hide the ones not containing the input while showing the ones that do
                $.chat_users.find("a:not(:Contains(" + filter + "))").parent().slideUp();
                $.chat_users.find("a:Contains(" + filter + ")").parent().slideDown();
            } else {
                $.chat_users.find("li").slideDown();
            }
            return false;
        }).keyup(function() {
            // fire the above change event after every letter
            $(this).change();

        });

    }

    // on dom ready
    listFilter($.chat_users);

    // open chat list
    $.chat_list_btn.click(function() {
        $(this).parent('#chat-container').toggleClass('open');
    })

    $.chat_body.animate({
        scrollTop: $.chat_body[0].scrollHeight
    }, 500);




});
