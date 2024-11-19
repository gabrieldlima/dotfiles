{
  ...
}: {
  services.redshift = {
    enable = true;
    provider = "manual";
    latitude = -18.91;
    longitude = -48.26;
    settings = {
      redshift = {
        adjustment-method = "randr";
      };
    };
  };
}
