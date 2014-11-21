"Run the module `io.luolong.ceylon20148.ui.js`."
shared void run() {
    dynamic document;
    dynamic {
        document.getElementById("greeting")
                .innerHTML = req.status==200
        then req.responseText
        else "error";
    }
}