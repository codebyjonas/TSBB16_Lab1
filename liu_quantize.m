function y = liu_quantize(x, r, b, mode),

if strcmp(mode,'bipolar'),
  y = round(x / r * 2^(b-1));
  y(y > 2^(b-1) - 1) = 2^(b-1) - 1;
  y(y < -2^(b-1)) = -2^(b-1);
  y = y * r * 2^(1-b);
  return;
end

if strcmp(mode,'unipolar'),
  y = round(x / r * 2^b);
  y(y > 2^b - 1) = 2^b - 1;
  y(y < -2^b) = -2^b;
  y = y * r * 2^-b;
  return;
end

'liu_quantize ERROR: unknown mode'

return
