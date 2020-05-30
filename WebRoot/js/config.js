//核心配置
Do.setConfig('coreLib',[basedir+'jquery.js']);
//base
Do.add('base',{path:basedir+'base/page.js',requires:['icofont']});
//Do.add('jquery',{path:basedir+'jquery.js'});

//dialog
Do.add('dialog_css',{path:basedir+'artdialog/skins/default.css', type: 'css'});
Do.add('dialog_js',{path:basedir+'artdialog/artDialog.js',requires:['dialog_css']});
Do.add('dialog',{path:basedir+'artdialog/iframeTools.js',requires:['dialog_js']});

//calendar
Do.add('calendar',{path:basedir+'calendar/lhgcalendar.js'});

//chart
Do.add('excanvas',{path:basedir+'chart/excanvas.js'});
Do.add('chart',{path:basedir+'chart/chart.js'});

//color
Do.add('color_css',{path:basedir+'color/style.css', type: 'css'});
Do.add('color',{path:basedir+'color/soColorPacker.js',requires:['color_css']});

//edit
Do.add('edit',{path:basedir+'edit/editinplace.js'});

//editor
Do.add('editor_src',{path:basedir+'editor/kindeditor-min.js'});
Do.add('editor',{path:basedir+'editor/zh_CN.js',requires:['editor_src']});


//flags
Do.add('flags',{path:basedir+'flags/flags.css', type: 'css'});

//form
Do.add('form_css',{path:basedir+'form/style.css', type: 'css'});
Do.add('form_js',{path:basedir+'form/validform.js'});
Do.add('form',{path:basedir+'form/Validform_Datatype.js',requires:['form_css','form_js']});

//icofont
Do.add('icofont',{path:basedir+'icofont/font-awesome.min.css', type: 'css'});

//menu
Do.add('menu',{path:basedir+'menu/collapse.js'});

//page
Do.add('page',{path:basedir+'page/myPagination.js'});

//tabpanel
Do.add('tabpanel_js1',{path:basedir+'tabpanel/Fader.js'});
Do.add('tabpanel_js2',{path:basedir+'tabpanel/Math.uuid.js'});
Do.add('tabpanel_js3',{path:basedir+'tabpanel/md5.js'});
Do.add('tabpanel_css',{path:basedir+'tabpanel/style/TabPanel.css', type: 'css'});
Do.add('tabpanel',{path:basedir+'tabpanel/TabPanel.js',requires:['tabpanel_js1','tabpanel_js2','tabpanel_js3','tabpanel_css']});

//tabs
Do.add('tabs',{path:basedir+'tabs/idTabs.js'});

//tip
Do.add('tip_css',{path:basedir+'tip/style.css', type: 'css'});
Do.add('tip',{path:basedir+'tip/powerFloat.js',requires:['tip_css']});

//tree
Do.add('tree',{path:basedir+'tree/ztree.js'});

//swfobject
Do.add('swfobject',{path:basedir+'upload/swfobject.js'});


