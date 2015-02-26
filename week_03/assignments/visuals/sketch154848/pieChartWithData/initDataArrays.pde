
void setData ()
{
  // prepare data from json -----------------------------

  names = new String [0];            // [person]
  int [] photosperName = new int [0];         // [person]
  int [] [] viewPerPhoto = new int [0] [0];   // [person] [photo]

    // how many different person are in the json?

  for (int i = 0; i < flickrData.size (); i++)
  {
    JSONObject p = flickrData.getJSONObject(i); 

    String name = p.getString ("author");

    boolean foundInList = false;

    for (int j = 0; j < names.length; j++)
    {
      if (names[j].equals (name))
      {
        foundInList = true;
        break;
      }
    }
    if (!foundInList) names = append (names, name);
  }

  // println (names);

  // how many photos are linked to each name and how often each one was visited ----------------------------------------------

  for (int j = 0; j < names.length; j++)
  {
    int [] view = new int [0];

    int count = 0;
    for (int i = 0; i < flickrData.size (); i++)
    {      
      JSONObject p = flickrData.getJSONObject(i); 
      String name = p.getString ("author");
      int photoview = p.getInt ("views");

      if (names[j].equals (name))
      {
        view = append (view, photoview);
        count++;
      }
    }

    viewPerPhoto = (int [] []) append (viewPerPhoto, view);
    photosperName = append (photosperName, count);
  }

  // print tag data

  /*
  for (int i = 0; i < viewPerPhoto.length; i++)
   {
   for (int j = 0; j < viewPerPhoto[i].length; j++)
   {
   println (viewPerPhoto[i] [j]);
   }
   }
   */

  // save data in array -------------------------------

  int i = 0;

  rVals = new float [0] [0];
  int num = names.length;

  minVal = 20; // kleinste anzahl von Fotos von einer Person
  maxVal = 0; // größte anzahl von Fotos von einer Person
  minViews = 1000000;
  maxViews = 0;

  total = flickrData.size ();  // anzahl der Fotos insgesamt

  while (i < num)
  {
    float rowTotal = 0;
    int numPerRow = viewPerPhoto [i].length;//photosperName [i];
    float [] vals = new float [numPerRow];

    if (numPerRow > maxVal) maxVal = numPerRow;
    else if (numPerRow < minVal) minVal = numPerRow;

    int j = 0;
    while (j < vals.length)
    {
      vals [j] = viewPerPhoto [i] [j];
      rowTotal = rowTotal + vals [j];

      if (vals [j] < minViews) minViews = vals [j];
      if (vals [j] > maxViews) maxViews = vals [j];

      j = j + 1;
    }

    rVals = (float [] []) append (rVals, vals);

    i = i + 1;
  }
}

