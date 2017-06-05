#
## Consulta el servicio REST de sepa usando httpie
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

#alias sepahttp="http -a ${SEPA_REST_USERNAME}:${SEPA_REST_PASSWORD} ${SEPA_REST_ENDPOINT}"
