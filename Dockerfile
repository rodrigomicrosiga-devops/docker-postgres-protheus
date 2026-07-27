FROM postgres:16

# Instala o gerador de locales e garante a presença do pt_BR.CP1252 exigido no script
RUN apt-get update && apt-get install -y locales && \
    echo "pt_BR ISO-8859-1" >> /etc/locale.gen && \
    echo "pt_BR.CP1252 CP1252" >> /etc/locale.gen && \
    locale-gen && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

# Copia o script unificado para a pasta de inicialização nativa
COPY init-protheus.sh /docker-entrypoint-initdb.d/init-protheus.sh

# Força a permissão de execução do script
RUN chmod +x /docker-entrypoint-initdb.d/init-protheus.sh

# pg_isready já vem na imagem oficial -- checa se o Postgres está de fato
# aceitando conexões, não só se a porta está aberta.
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1