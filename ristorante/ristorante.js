  window.onload = bindEvents;
  var global_idUtente;


//al click dei bottom, attiva le funzioni
function bindEvents(){
  $("#accedi").click(autenticazione); //al click su "accedi" esegue la funzione "autenticazione"
 
}

//funzione che gestisce l'autenticazione dell'esaminatore e restituisce il suo id.
function autenticazione(){
 $.ajax({
              //modifica l'url utilizzando ajax in modo tale da non ricaricare la pagina ogni volta che inseriamo i dati
              url: "connection.php?query=accedi&username=" + $("#username").val() + "&password=" + $("#password").val(),
              //stampa nel paragrafo p i messaggi
              success: function(data){
                $("#rispostephp").html(data);
      //il server ritorna in data solo un valore che è stringa
            console.log(data);
            JSON.parse(data, (key, value) => //trasformazione del valore della stringa ripostata da data in file javascript
             typeof value === 'number');    
        object=eval(data); //eval trasforma la stringa in "stringa oggetto"
        //console.log(object.length);
        //console.log(object[0].IDtipoUtente);
        if (object.length == 0) {
          window.alert("NON Autenticato! Inserisci Username e Password corretti");
          location.replace("http://localhost/ristorante/index.html");
        }
        else if (object[0].IDtipoUtente==1) {
          console.log(object[0].IDtipoUtente);
          global_idUtente = object[0].ID;
          window.alert("Amministratore!!");
          location.replace("http://localhost/ristorante/admin.html");
        }
        else if (object[0].IDtipoUtente==2) {
          console.log(object[0].IDtipoUtente);
          global_idUtente = object[0].ID;
          window.alert("Ciao Cameriere!!");
          location.replace("http://localhost/ristorante/cameriere.html");
        }
        else if (object[0].IDtipoUtente==6) {
          console.log(object[0].IDtipoUtente);
          global_idUtente = object[0].ID;
          window.alert("Ciao Cuoco!!");
          location.replace("http://localhost/ristorante/cuoco.html");
        }
      }
    })
}
