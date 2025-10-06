# GA - Overlays config
{
  inputs,
  system,
  ...
}: {
  version-refs = final: prev:
    prev
    // {
      stable = prev;
    };
  trivial = final: prev: prev;
}