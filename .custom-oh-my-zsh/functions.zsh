#
## Consulta el servicio REST de sepa usando httpie
## Necesita httpie y "pass" funcionando, con la clave de sepa almacenada en sepa/rest (formato username:password)
#

function sepahttp {
  if [[ "$#" -lt 1 ]]; then
    # Debe mandar una url
    echo "Debe enviar una url"
    return 1
  fi
  if [[ ${SEPA_REST_PROFILE} == "production" ]]; then
    # Consultamos al sepa de produccion
    local SEPA_REST_ENDPOINT="https://sepa.utem.cl/rest/api/v1"
  elif [[ ${SEPA_REST_PROFILE} == "mock" ]]; then
    # Consultamos al sepa mock del 8081 en localhost
    local SEPA_REST_ENDPOINT="http://localhost:8081"
  else
    echo "No se configuro el perfil de SEPA rest"
    return 1
  fi
  local URL=${SEPA_REST_ENDPOINT}$1
  shift
  http -a $(pass show sepa/rest) $@ ${URL}
}

#
## Consulta los endpoints disponibles en wiremock (localhost:8081)
## Necesita httpie y jq
#

function mock-ls {
  http http://localhost:8081/__admin/ | jq '[.mappings[] | {url: .request.url, method: .request.method, status: .response.status, file: .response.bodyFileName}]'
}
