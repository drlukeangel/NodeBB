"use strict";define("plugin/emoji-extended/debug",function(){var a=Array.prototype.slice,b="distribution",c="development"===b,d={enabled:c,_log:function(){var b=1<=arguments.length?a.call(arguments,0):[];console.log.apply(console,["nodebb-plugin-emoji-extended DEBUG -"].concat(a.call(b)))},log:function(){var b=1<=arguments.length?a.call(arguments,0):[];c&&d._log.apply(null,b)},error:function(){console.error.apply(console,["nodebb-plugin-emoji-extended ERROR -"].concat(a.call(arguments)))}};return d.log("Debug-mode is enabled."),d});