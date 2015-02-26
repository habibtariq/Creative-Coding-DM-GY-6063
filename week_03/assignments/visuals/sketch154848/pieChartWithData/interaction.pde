void keyPressed ()
{
  if (key == 'p') drawInfo = !drawInfo;
  if (key == '1')
  {
    filePath = "'processing.org'.json";
    loadJson();
    setData();
  }

  if (key == '2')
  {
    filePath = "generative&visualization&processing.json";
    loadJson();
    setData();
  }

  if (key == '3')
  {
    filePath = "generative&processing.json";
    loadJson();
    setData();
  }

  if (key == 's') saveFrame( "export/####.png");
}

