sap.ui.define(["sap/ui/core/mvc/ControllerExtension","sap/ui/model/json/JSONModel"],function(e,t){"use strict";return e.extend("PO_Cockpit.ext.controller.PdfControllerDraft",{override:{onInit:function(){var e=this.base.getExtensionAPI().getModel()},routing:{onAfterBinding:async function(e){debugger;var n=this.getView();const o=this.base.getExtensionAPI(),i=o.getModel(),r="getPdfUrlD",d=i.bindContext(`/${r}(...)`);await d.execute();var g=d.getBoundContext();var l=g.getObject();debugger;await d.execute();debugger;g=d.getBoundContext();l=g.getObject();l=l.value.file_link;console.log(l);debugger;var s=new t({pdfUrl:l});n.setModel(s,"pdfModel")}}}})});