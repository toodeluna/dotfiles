{ ... }:
{
  console.useXkbConfig = true;

  services.xserver.xkb = {
    layout = "us";
    options = "caps:escape";
  };
}
