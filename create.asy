import three;

settings.outformat = "png";
settings.render = 30;

size(100, 0);

currentlight = light(gray(0.8), (8, -8, 0.5));
currentlight.background = black;

currentprojection = perspective(12, -1, 8);

path3 back = path3(polygon(3));
back = rotate(90, point(back, 0), point(back, 1)) * back;

path3 front = shift(1.5 * X) * back;

draw(
  surface(
    patch(new triple[] { point(back, 0), point(back, 1), point(back, 2) }),
    patch(new triple[] { point(front, 0), point(front, 1), point(front, 2) }),
    patch(new triple[] { point(front, 0), point(back, 0), point(back, 2), point(front, 2) }), // left
    patch(new triple[] { point(front, 1), point(back, 1), point(back, 2), point(front, 2) }), // right
    patch(new triple[] { point(front, 0), point(back, 0), point(back, 1), point(front, 1) }) // bottom
  ),
  material(diffusepen=rgb(0, 0, 0.45), emissivepen=gray(0.1), specularpen=yellow)
);
