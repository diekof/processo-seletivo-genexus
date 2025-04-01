window.onload = function() {
  //<editor-fold desc="Changeable Configuration Block">

  // the following lines will be replaced by docker/configurator, when it runs in a docker-container
  window.ui = SwaggerUIBundle({
    urls: [
      {url: "../api.Auth.yaml", name: "auth"},
      {url: "../api.Cidade.yaml", name: "cidade"},
      {url: "../api.Pessoa.yaml", name: "pessoa"},
      {url: "../api.ServidorEfetivo.yaml", name: "servidorefetivo"},
      {url: "../api.Teste.yaml", name: "teste"}
    ],    
    dom_id: '#swagger-ui',
    deepLinking: true,
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    plugins: [
      SwaggerUIBundle.plugins.DownloadUrl
    ],
    layout: "StandaloneLayout"
  });

  //</editor-fold>
};
