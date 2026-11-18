{
  services.ollama = {
    enable = true;

    # Start with a small model
    loadModels = [ "gemma3:4b" ];
  };

  services.open-webui = {
    enable = true;
    port = 8080;
    host = "127.0.0.1";

    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    };
  };
}
