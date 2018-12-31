AudioOutput music;
Minim minim;
AudioRecorder recorder;
int octave[] = {1, 2, 3, 4, 5, 6, 7, 8, 9}, time, note;
boolean chords = true, playing = true;
int selectedOctave = 3;
String cmaj[] = {"C" + octave[3], "D" + octave[3], "E" + octave[3], "F" + octave[3], "G" + octave[3], "A" + octave[3], "B" + octave[3], "C" + octave[4], "D" + octave[4], "E" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5]}; //C Major
//String scales[][][] = 
// //The Following Scales are Major Scales
// {
// {
// //{"Not Actually a Scale"}, 
// //{"C" + octave[0], "D" + octave[0], "E" + octave[0], "F" + octave[0], "G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1]}, //C Major
// //{"Db" + octave[0], "Eb" + octave[0], "F" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db"  + octave[1], "Eb"  + octave[1], "F"  + octave[1], "Gb"  + octave[1], "Ab" + octave[1]}, //C# or Db Major
// //{"D"  + octave[0], "E" + octave[0], "Gb" + octave[0], "G" + octave[0], "A" +  + octave[0], "B" +  + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" + octave[1]}, //D Major
// //{"Eb" + octave[0], "F" + octave[0], "G" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1]}, //D# or Eb Major
// //{"E" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1]},  //E Major
// //{"F" + octave[0], "G" + octave[0], "A" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2]},  //F Major
// //{"Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2]}, //F# or Gb Major
// //{"G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" + octave[1], "B" + octave[1], "C" + octave[2], "D" + octave[2]}, //G Major
// //{"Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "Db" + octave[2], "Eb" + octave[2]}, //G# or Ab Major
// //{"A" + octave[0], "B" + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1], "Db" + octave[2], "D" + octave[2], "E" + octave[2]}, //A Major
// //{"Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2], "D" + octave[2], "Eb" + octave[2], "F" + octave[2]}, //A# or Bb Major
// //{"B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "Gb" + octave[2]}, //B Major 
// ////The Following Scales are Harmonic Minor Scales
// //{"A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G#" + octave[1], "A" + octave[1]}, //A Harmonic Minor
// //{"Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "A" + octave[1], "Bb" + octave[1]}, //A# or Bb Harmonic Minor
// //{"B" + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "Bb" + octave[1], "B" + octave[1]}, //B Harmonic Minor
// //{"C" + octave[0], "D" + octave[0], "Eb" + octave[0], "F" + octave[0], "G" + octave[0], "Ab" + octave[0], "B" + octave[0], "C" + octave[1]}, //C Harmonic Minor
// //{"Db" + octave[0], "Eb" + octave[0], "E" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "C" + octave[1], "Db" + octave[1]}, //C# or Db Harmonic Minor
// //{"D" + octave[0], "E" + octave[0], "F" + octave[0], "G" + octave[0], "A" + octave[0], "Bb" + octave[0], "Db" + octave[1], "D" + octave[1]}, //D Harmonic Minor
// //{"Eb" + octave[0], "F" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "D" + octave[1], "Eb" + octave[1]}, //D# or Eb Harmonic Minor
// //{"E" + octave[0], "Gb" + octave[0], "G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "Eb" + octave[1], "E" + octave[1]}, //E Harmonic Minor
// //{"F" + octave[0], "G" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "E" + octave[1], "F" + octave[1]}, //F Harmonic Minor
// //{"Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "B" + octave[0], "Db" + octave[1], "D" + octave[1], "F" + octave[1], "Gb" + octave[1]}, //F# or Gb Harmonic Minor
// //{"G" + octave[0], "A" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "Gb" + octave[1], "G" + octave[1]}, //G Harmonic Minor
// //{"Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "G" + octave[1], "Ab" + octave[1]}, //G# or Ab Harmonic Minor
// //////The Chrome Zone
// ////{"Ab" + octave[0], "A" + octave[0], "Bb" + octave[0], "B" + octave[0], "C" + octave[1], "Db" + octave[1], "D" + octave[1], "Eb" + octave[1], "E" + octave[1], "F" + octave[1], "Gb" + octave[1], "G" + octave[1]} //Chromatic Scale
// },
// {
// //{"Not Actually a Scale"}, 
// //{"C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "B" + octave[1], "C" + octave[2], "D" + octave[2], "E" + octave[2], "F" + octave[2], "G" + octave[2]}, //C Major
// //{"Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "Db"  + octave[2], "Eb"  + octave[2], "F"  + octave[2], "Gb"  + octave[2], "Ab" + octave[2]}, //C# or Db Major
// //{"D"  + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" +  + octave[1], "B" +  + octave[1], "Db" + octave[2], "D" + octave[2], "E" + octave[2], "Gb" + octave[2], "G" + octave[2], "A" + octave[2]}, //D Major
// //{"Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "D" + octave[2], "Eb" + octave[2], "F" + octave[2], "G" + octave[2], "Ab" + octave[2], "Bb" + octave[2]}, //D# or Eb Major
// //{"E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "A" + octave[2], "B" + octave[2]},  //E Major
// //{"F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2], "D" + octave[2], "E" + octave[2], "F" + octave[2], "G" + octave[2], "A" + octave[2], "Bb" + octave[2], "C" + octave[3]},  //F Major
// //{"Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "F" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "B" + octave[2], "Db" + octave[3]}, //F# or Gb Major
// //{"G" + octave[1], "A" + octave[1], "B" + octave[1], "C" + octave[2], "D" + octave[2], "E" + octave[2], "Gb" + octave[2], "G" + octave[2], "A" + octave[2], "B" + octave[2], "C" + octave[3], "D" + octave[3]}, //G Major
// //{"Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "Db" + octave[2], "Eb" + octave[2], "F" + octave[2], "G" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "C" + octave[3], "Db" + octave[3], "Eb" + octave[3]}, //G# or Ab Major
// //{"A" + octave[1], "B" + octave[1], "Db" + octave[2], "D" + octave[2], "E" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "A" + octave[2], "B" + octave[2], "Db" + octave[3], "D" + octave[3], "E" + octave[3]}, //A Major
// //{"Bb" + octave[1], "C" + octave[2], "D" + octave[2], "Eb" + octave[2], "F" + octave[2], "G" + octave[2], "A" + octave[2], "Bb" + octave[2], "C" + octave[3], "D" + octave[3], "Eb" + octave[3], "F" + octave[3]}, //A# or Bb Major
// //{"B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "B" + octave[2], "Db" + octave[3], "Eb" + octave[3], "E" + octave[3], "Gb" + octave[3]}, //B Major 
// ////The Following Scales are Harmonic Minor Scales
// //{"A" + octave[1], "B" + octave[1], "C" + octave[2], "D" + octave[2], "E" + octave[2], "F" + octave[2], "G#" + octave[2], "A" + octave[2]}, //A Harmonic Minor
// //{"Bb" + octave[1], "C" + octave[2], "Db" + octave[2], "Eb" + octave[2], "F" + octave[2], "Gb" + octave[2], "A" + octave[2], "Bb" + octave[2]}, //A# or Bb Harmonic Minor
// //{"B" + octave[1], "Db" + octave[2], "D" + octave[2], "E" + octave[2], "Gb" + octave[2], "G" + octave[2], "Bb" + octave[2], "B" + octave[2]}, //B Harmonic Minor
// //{"C" + octave[1], "D" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "B" + octave[1], "C" + octave[2]}, //C Harmonic Minor
// //{"Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "C" + octave[2], "Db" + octave[2]}, //C# or Db Harmonic Minor
// //{"D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "Db" + octave[2], "D" + octave[2]}, //D Harmonic Minor
// //{"Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "D" + octave[2], "Eb" + octave[2]}, //D# or Eb Harmonic Minor
// //{"E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" + octave[1], "B" + octave[1], "C" + octave[2], "Eb" + octave[2], "E" + octave[2]}, //E Harmonic Minor
// //{"F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "Db" + octave[2], "E" + octave[2], "F" + octave[2]}, //F Harmonic Minor
// //{"Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1], "Db" + octave[2], "D" + octave[2], "F" + octave[2], "Gb" + octave[2]}, //F# or Gb Harmonic Minor
// //{"G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2], "D" + octave[2], "Eb" + octave[2], "Gb" + octave[2], "G" + octave[2]}, //G Harmonic Minor
// //{"Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "G" + octave[2], "Ab" + octave[2]}, //G# or Ab Harmonic Minor
// //////The Chrome Zone
// ////{"Ab" + octave[1], "A" + octave[1], "Bb" + octave[1], "B" + octave[1], "C" + octave[2], "Db" + octave[2], "D" + octave[2], "Eb" + octave[2], "E" + octave[2], "F" + octave[2], "Gb" + octave[2], "G" + octave[2]} //Chromatic Scale
// },
// {
// //{"Not Actually a Scale"}, 
// //{"C" + octave[2], "D" + octave[2], "E" + octave[2], "F" + octave[2], "G" + octave[2], "A" + octave[2], "B" + octave[2], "C" + octave[3], "D" + octave[3], "E" + octave[3], "F" + octave[3], "G" + octave[3]}, //C Major
// //{"Db" + octave[2], "Eb" + octave[2], "F" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "C" + octave[3], "Db"  + octave[3], "Eb"  + octave[3], "F"  + octave[3], "Gb"  + octave[3], "Ab" + octave[3]}, //C# or Db Major
// //{"D"  + octave[2], "E" + octave[2], "Gb" + octave[2], "G" + octave[2], "A" +  + octave[2], "B" +  + octave[2], "Db" + octave[3], "D" + octave[3], "E" + octave[3], "Gb" + octave[3], "G" + octave[3], "A" + octave[3]}, //D Major
// //{"Eb" + octave[2], "F" + octave[2], "G" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "C" + octave[3], "D" + octave[3], "Eb" + octave[3], "F" + octave[3], "G" + octave[3], "Ab" + octave[3], "Bb" + octave[3]}, //D# or Eb Major
// //{"E" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "A" + octave[2], "B" + octave[2], "Db" + octave[3], "Eb" + octave[3], "E" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "A" + octave[3], "B" + octave[3]},  //E Major
// //{"F" + octave[2], "G" + octave[2], "A" + octave[2], "Bb" + octave[2], "C" + octave[3], "D" + octave[3], "E" + octave[3], "F" + octave[3], "G" + octave[3], "A" + octave[3], "Bb" + octave[3], "C" + octave[4]},  //F Major
// //{"Gb" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "B" + octave[2], "Db" + octave[3], "Eb" + octave[3], "F" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "B" + octave[3], "Db" + octave[4]}, //F# or Gb Major
// //{"G" + octave[2], "A" + octave[2], "B" + octave[2], "C" + octave[3], "D" + octave[3], "E" + octave[3], "Gb" + octave[3], "G" + octave[3], "A" + octave[3], "B" + octave[3], "C" + octave[4], "D" + octave[4]}, //G Major
// //{"Ab" + octave[2], "Bb" + octave[2], "C" + octave[3], "Db" + octave[3], "Eb" + octave[3], "F" + octave[3], "G" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "C" + octave[4], "Db" + octave[4], "Eb" + octave[4]}, //G# or Ab Major
// //{"A" + octave[2], "B" + octave[2], "Db" + octave[3], "D" + octave[3], "E" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "A" + octave[3], "B" + octave[3], "Db" + octave[4], "D" + octave[4], "E" + octave[4]}, //A Major
// //{"Bb" + octave[2], "C" + octave[3], "D" + octave[3], "Eb" + octave[3], "F" + octave[3], "G" + octave[3], "A" + octave[3], "Bb" + octave[3], "C" + octave[4], "D" + octave[4], "Eb" + octave[4], "F" + octave[4]}, //A# or Bb Major
// //{"B" + octave[2], "Db" + octave[3], "Eb" + octave[3], "E" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "B" + octave[3], "Db" + octave[4], "Eb" + octave[4], "E" + octave[4], "Gb" + octave[4]}, //B Major 
// ////The Following Scales are Harmonic Minor Scales
// //{"A" + octave[2], "B" + octave[2], "C" + octave[3], "D" + octave[3], "E" + octave[3], "F" + octave[3], "G#" + octave[3], "A" + octave[3]}, //A Harmonic Minor
// //{"Bb" + octave[2], "C" + octave[3], "Db" + octave[3], "Eb" + octave[3], "F" + octave[3], "Gb" + octave[3], "A" + octave[3], "Bb" + octave[3]}, //A# or Bb Harmonic Minor
// //{"B" + octave[2], "Db" + octave[3], "D" + octave[3], "E" + octave[3], "Gb" + octave[3], "G" + octave[3], "Bb" + octave[3], "B" + octave[3]}, //B Harmonic Minor
// //{"C" + octave[2], "D" + octave[2], "Eb" + octave[2], "F" + octave[2], "G" + octave[2], "Ab" + octave[2], "B" + octave[2], "C" + octave[3]}, //C Harmonic Minor
// //{"Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "A" + octave[2], "C" + octave[3], "Db" + octave[3]}, //C# or Db Harmonic Minor
// //{"D" + octave[2], "E" + octave[2], "F" + octave[2], "G" + octave[2], "A" + octave[2], "Bb" + octave[2], "Db" + octave[3], "D" + octave[3]}, //D Harmonic Minor
// //{"Eb" + octave[2], "F" + octave[2], "Gb" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "B" + octave[2], "D" + octave[3], "Eb" + octave[3]}, //D# or Eb Harmonic Minor
// //{"E" + octave[2], "Gb" + octave[2], "G" + octave[2], "A" + octave[2], "B" + octave[2], "C" + octave[3], "Eb" + octave[3], "E" + octave[3]}, //E Harmonic Minor
// //{"F" + octave[2], "G" + octave[2], "Ab" + octave[2], "Bb" + octave[2], "C" + octave[3], "Db" + octave[3], "E" + octave[3], "F" + octave[3]}, //F Harmonic Minor
// //{"Gb" + octave[2], "Ab" + octave[2], "A" + octave[2], "B" + octave[2], "Db" + octave[3], "D" + octave[3], "F" + octave[3], "Gb" + octave[3]}, //F# or Gb Harmonic Minor
// //{"G" + octave[2], "A" + octave[2], "Bb" + octave[2], "C" + octave[3], "D" + octave[3], "Eb" + octave[3], "Gb" + octave[3], "G" + octave[3]}, //G Harmonic Minor
// //{"Ab" + octave[2], "Bb" + octave[2], "B" + octave[2], "Db" + octave[3], "Eb" + octave[3], "E" + octave[3], "G" + octave[3], "Ab" + octave[3]}, //G# or Ab Harmonic Minor
// //////The Chrome Zone
// ////{"Ab" + octave[2], "A" + octave[2], "Bb" + octave[2], "B" + octave[2], "C" + octave[3], "Db" + octave[3], "D" + octave[3], "Eb" + octave[3], "E" + octave[3], "F" + octave[3], "Gb" + octave[3], "G" + octave[3]} //Chromatic Scale
// },
// {
// {"Not Actually a Scale"}, 
// {"C" + octave[3], "D" + octave[3], "E" + octave[3], "F" + octave[3], "G" + octave[3], "A" + octave[3], "B" + octave[3], "C" + octave[4], "D" + octave[4], "E" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5]}, //C Major
// //{"Db" + octave[3], "Eb" + octave[3], "F" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "C" + octave[4], "Db"  + octave[4], "Eb"  + octave[4], "F"  + octave[4], "Gb"  + octave[4], "Ab" + octave[4]}, //C# or Db Major
// //{"D"  + octave[3], "E" + octave[3], "Gb" + octave[3], "G" + octave[3], "A" +  + octave[3], "B" +  + octave[3], "Db" + octave[4], "D" + octave[4], "E" + octave[4], "Gb" + octave[4], "G" + octave[4], "A" + octave[4]}, //D Major
// //{"Eb" + octave[3], "F" + octave[3], "G" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "C" + octave[4], "D" + octave[4], "Eb" + octave[4], "F" + octave[4], "G" + octave[4], "Ab" + octave[4], "Bb" + octave[4]}, //D# or Eb Major
// //{"E" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "A" + octave[3], "B" + octave[3], "Db" + octave[4], "Eb" + octave[4], "E" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "A" + octave[4], "B" + octave[4]},  //E Major
// //{"F" + octave[3], "G" + octave[3], "A" + octave[3], "Bb" + octave[3], "C" + octave[4], "D" + octave[4], "E" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "Bb" + octave[4], "C" + octave[5]},  //F Major
// //{"Gb" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "B" + octave[3], "Db" + octave[4], "Eb" + octave[4], "F" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "B" + octave[4], "Db" + octave[5]}, //F# or Gb Major
// //{"G" + octave[3], "A" + octave[3], "B" + octave[3], "C" + octave[4], "D" + octave[4], "E" + octave[4], "Gb" + octave[4], "G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5], "D" + octave[5]}, //G Major
// //{"Ab" + octave[3], "Bb" + octave[3], "C" + octave[4], "Db" + octave[4], "Eb" + octave[4], "F" + octave[4], "G" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "C" + octave[5], "Db" + octave[5], "Eb" + octave[5]}, //G# or Ab Major
// //{"A" + octave[3], "B" + octave[3], "Db" + octave[4], "D" + octave[4], "E" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "A" + octave[4], "B" + octave[4], "Db" + octave[5], "D" + octave[5], "E" + octave[5]}, //A Major
// //{"Bb" + octave[3], "C" + octave[4], "D" + octave[4], "Eb" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "Bb" + octave[4], "C" + octave[5], "D" + octave[5], "Eb" + octave[5], "F" + octave[5]}, //A# or Bb Major
// //{"B" + octave[3], "Db" + octave[4], "Eb" + octave[4], "E" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "B" + octave[4], "Db" + octave[5], "Eb" + octave[5], "E" + octave[5], "Gb" + octave[5]}, //B Major 
// //The Following Scales are Harmonic Minor Scales
// {"A" + octave[3], "B" + octave[3], "C" + octave[4], "D" + octave[4], "E" + octave[4], "F" + octave[4], "G#" + octave[4], "A" + octave[4]}, //A Harmonic Minor
// {"Bb" + octave[3], "C" + octave[4], "Db" + octave[4], "Eb" + octave[4], "F" + octave[4], "Gb" + octave[4], "A" + octave[4], "Bb" + octave[4]}, //A# or Bb Harmonic Minor
// {"B" + octave[3], "Db" + octave[4], "D" + octave[4], "E" + octave[4], "Gb" + octave[4], "G" + octave[4], "Bb" + octave[4], "B" + octave[4]}, //B Harmonic Minor
// {"C" + octave[3], "D" + octave[3], "Eb" + octave[3], "F" + octave[3], "G" + octave[3], "Ab" + octave[3], "B" + octave[3], "C" + octave[4]}, //C Harmonic Minor
// {"Db" + octave[3], "Eb" + octave[3], "E" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "A" + octave[3], "C" + octave[4], "Db" + octave[4]}, //C# or Db Harmonic Minor
// {"D" + octave[3], "E" + octave[3], "F" + octave[3], "G" + octave[3], "A" + octave[3], "Bb" + octave[3], "Db" + octave[4], "D" + octave[4]}, //D Harmonic Minor
// {"Eb" + octave[3], "F" + octave[3], "Gb" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "B" + octave[3], "D" + octave[4], "Eb" + octave[4]}, //D# or Eb Harmonic Minor
// {"E" + octave[3], "Gb" + octave[3], "G" + octave[3], "A" + octave[3], "B" + octave[3], "C" + octave[4], "Eb" + octave[4], "E" + octave[4]}, //E Harmonic Minor
// {"F" + octave[3], "G" + octave[3], "Ab" + octave[3], "Bb" + octave[3], "C" + octave[4], "Db" + octave[4], "E" + octave[4], "F" + octave[4]}, //F Harmonic Minor
// {"Gb" + octave[3], "Ab" + octave[3], "A" + octave[3], "B" + octave[3], "Db" + octave[4], "D" + octave[4], "F" + octave[4], "Gb" + octave[4]}, //F# or Gb Harmonic Minor
// {"G" + octave[3], "A" + octave[3], "Bb" + octave[3], "C" + octave[4], "D" + octave[4], "Eb" + octave[4], "Gb" + octave[4], "G" + octave[4]}, //G Harmonic Minor
// {"Ab" + octave[3], "Bb" + octave[3], "B" + octave[3], "Db" + octave[4], "Eb" + octave[4], "E" + octave[4], "G" + octave[4], "Ab" + octave[4]}, //G# or Ab Harmonic Minor
// ////The Chrome Zone
// //{"Ab" + octave[3], "A" + octave[3], "Bb" + octave[3], "B" + octave[3], "C" + octave[4], "Db" + octave[4], "D" + octave[4], "Eb" + octave[4], "E" + octave[4], "F" + octave[4], "Gb" + octave[4], "G" + octave[4]} //Chromatic Scale
// },
// {
// {"Not Actually a Scale"}, 
// {"C" + octave[4], "D" + octave[4], "E" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5], "D" + octave[5], "E" + octave[5], "F" + octave[5], "G" + octave[5], "A" + octave[5], "B" + octave[5], "C" + octave[6]}, //C Major
// {"Db" + octave[4], "Eb" + octave[4], "F" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "C" + octave[5], "Db"  + octave[5], "Eb"  + octave[5], "F"  + octave[5], "Gb"  + octave[5], "Ab" + octave[5]}, //C# or Db Major
// {"D"  + octave[4], "E" + octave[4], "Gb" + octave[4], "G" + octave[4], "A" +  + octave[4], "B" +  + octave[4], "Db" + octave[5], "D" + octave[5], "E" + octave[5], "Gb" + octave[5], "G" + octave[5], "A" + octave[5]}, //D Major
// {"Eb" + octave[4], "F" + octave[4], "G" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "C" + octave[5], "D" + octave[5], "Eb" + octave[5], "F" + octave[5], "G" + octave[5], "Ab" + octave[5], "Bb" + octave[5]}, //D# or Eb Major
// {"E" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "A" + octave[4], "B" + octave[4], "Db" + octave[5], "Eb" + octave[5], "E" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "A" + octave[5], "B" + octave[5]},  //E Major
// {"F" + octave[4], "G" + octave[4], "A" + octave[4], "Bb" + octave[4], "C" + octave[5], "D" + octave[5], "E" + octave[5], "F" + octave[5], "G" + octave[5], "A" + octave[5], "Bb" + octave[5], "C" + octave[6]},  //F Major
// {"Gb" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "B" + octave[4], "Db" + octave[5], "Eb" + octave[5], "F" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "B" + octave[5], "Db" + octave[6]}, //F# or Gb Major
// {"G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5], "D" + octave[5], "E" + octave[5], "Gb" + octave[5], "G" + octave[5], "A" + octave[5], "B" + octave[5], "C" + octave[6], "D" + octave[6]}, //G Major
// {"Ab" + octave[4], "Bb" + octave[4], "C" + octave[5], "Db" + octave[5], "Eb" + octave[5], "F" + octave[5], "G" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "C" + octave[6], "Db" + octave[6], "Eb" + octave[6]}, //G# or Ab Major
// {"A" + octave[4], "B" + octave[4], "Db" + octave[5], "D" + octave[5], "E" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "A" + octave[5], "B" + octave[5], "Db" + octave[6], "D" + octave[6], "E" + octave[6]}, //A Major
// {"Bb" + octave[4], "C" + octave[5], "D" + octave[5], "Eb" + octave[5], "F" + octave[5], "G" + octave[5], "A" + octave[5], "Bb" + octave[5], "C" + octave[6], "D" + octave[6], "Eb" + octave[6], "F" + octave[6]}, //A# or Bb Major
// {"B" + octave[4], "Db" + octave[5], "Eb" + octave[5], "E" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "B" + octave[5], "Db" + octave[6], "Eb" + octave[6], "E" + octave[6], "Gb" + octave[6]}, //B Major 
// //The Following Scales are Harmonic Minor Scales
// {"A" + octave[4], "B" + octave[4], "C" + octave[5], "D" + octave[5], "E" + octave[5], "F" + octave[5], "G#" + octave[5], "A" + octave[5]}, //A Harmonic Minor
// {"Bb" + octave[4], "C" + octave[5], "Db" + octave[5], "Eb" + octave[5], "F" + octave[5], "Gb" + octave[5], "A" + octave[5], "Bb" + octave[5]}, //A# or Bb Harmonic Minor
// {"B" + octave[4], "Db" + octave[5], "D" + octave[5], "E" + octave[5], "Gb" + octave[5], "G" + octave[5], "Bb" + octave[5], "B" + octave[5]}, //B Harmonic Minor
// {"C" + octave[4], "D" + octave[4], "Eb" + octave[4], "F" + octave[4], "G" + octave[4], "Ab" + octave[4], "B" + octave[4], "C" + octave[5]}, //C Harmonic Minor
// {"Db" + octave[4], "Eb" + octave[4], "E" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "A" + octave[4], "C" + octave[5], "Db" + octave[5]}, //C# or Db Harmonic Minor
// {"D" + octave[4], "E" + octave[4], "F" + octave[4], "G" + octave[4], "A" + octave[4], "Bb" + octave[4], "Db" + octave[5], "D" + octave[5]}, //D Harmonic Minor
// {"Eb" + octave[4], "F" + octave[4], "Gb" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "B" + octave[4], "D" + octave[5], "Eb" + octave[5]}, //D# or Eb Harmonic Minor
// {"E" + octave[4], "Gb" + octave[4], "G" + octave[4], "A" + octave[4], "B" + octave[4], "C" + octave[5], "Eb" + octave[5], "E" + octave[5]}, //E Harmonic Minor
// {"F" + octave[4], "G" + octave[4], "Ab" + octave[4], "Bb" + octave[4], "C" + octave[5], "Db" + octave[5], "E" + octave[5], "F" + octave[5]}, //F Harmonic Minor
// {"Gb" + octave[4], "Ab" + octave[4], "A" + octave[4], "B" + octave[4], "Db" + octave[5], "D" + octave[5], "F" + octave[5], "Gb" + octave[5]}, //F# or Gb Harmonic Minor
// {"G" + octave[4], "A" + octave[4], "Bb" + octave[4], "C" + octave[5], "D" + octave[5], "Eb" + octave[5], "Gb" + octave[5], "G" + octave[5]}, //G Harmonic Minor
// {"Ab" + octave[4], "Bb" + octave[4], "B" + octave[4], "Db" + octave[5], "Eb" + octave[5], "E" + octave[5], "G" + octave[5], "Ab" + octave[5]}, //G# or Ab Harmonic Minor
// ////The Chrome Zone
// //{"Ab" + octave[4], "A" + octave[4], "Bb" + octave[4], "B" + octave[4], "C" + octave[5], "Db" + octave[5], "D" + octave[5], "Eb" + octave[5], "E" + octave[5], "F" + octave[5], "Gb" + octave[5], "G" + octave[5]} //Chromatic Scale
// },
// {
// {"Not Actually a Scale"}, 
// {"C" + octave[5], "D" + octave[5], "E" + octave[5], "F" + octave[5], "G" + octave[5], "A" + octave[5], "B" + octave[5], "C" + octave[6], "D" + octave[6], "E" + octave[6], "F" + octave[6], "G" + octave[6]}, //C Major
// {"Db" + octave[5], "Eb" + octave[5], "F" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "C" + octave[6], "Db"  + octave[6], "Eb"  + octave[6], "F"  + octave[6], "Gb"  + octave[6], "Ab" + octave[6]}, //C# or Db Major
// {"D"  + octave[5], "E" + octave[5], "Gb" + octave[5], "G" + octave[5], "A" +  + octave[5], "B" +  + octave[5], "Db" + octave[6], "D" + octave[6], "E" + octave[6], "Gb" + octave[6], "G" + octave[6], "A" + octave[6]}, //D Major
// {"Eb" + octave[5], "F" + octave[5], "G" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "C" + octave[6], "D" + octave[6], "Eb" + octave[6], "F" + octave[6], "G" + octave[6], "Ab" + octave[6], "Bb" + octave[6]}, //D# or Eb Major
// {"E" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "A" + octave[5], "B" + octave[5], "Db" + octave[6], "Eb" + octave[6], "E" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "A" + octave[6], "B" + octave[6]},  //E Major
// {"F" + octave[5], "G" + octave[5], "A" + octave[5], "Bb" + octave[5], "C" + octave[6], "D" + octave[6], "E" + octave[6], "F" + octave[6], "G" + octave[6], "A" + octave[6], "Bb" + octave[6], "C" + octave[7]},  //F Major
// {"Gb" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "B" + octave[5], "Db" + octave[6], "Eb" + octave[6], "F" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "B" + octave[6], "Db" + octave[7]}, //F# or Gb Major
// {"G" + octave[5], "A" + octave[5], "B" + octave[5], "C" + octave[6], "D" + octave[6], "E" + octave[6], "Gb" + octave[6], "G" + octave[6], "A" + octave[6], "B" + octave[6], "C" + octave[7], "D" + octave[7]}, //G Major
// {"Ab" + octave[5], "Bb" + octave[5], "C" + octave[6], "Db" + octave[6], "Eb" + octave[6], "F" + octave[6], "G" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "C" + octave[7], "Db" + octave[7], "Eb" + octave[7]}, //G# or Ab Major
// {"A" + octave[5], "B" + octave[5], "Db" + octave[6], "D" + octave[6], "E" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "A" + octave[6], "B" + octave[6], "Db" + octave[7], "D" + octave[7], "E" + octave[7]}, //A Major
// {"Bb" + octave[5], "C" + octave[6], "D" + octave[6], "Eb" + octave[6], "F" + octave[6], "G" + octave[6], "A" + octave[6], "Bb" + octave[6], "C" + octave[7], "D" + octave[7], "Eb" + octave[7], "F" + octave[7]}, //A# or Bb Major
// {"B" + octave[5], "Db" + octave[6], "Eb" + octave[6], "E" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "B" + octave[6], "Db" + octave[7], "Eb" + octave[7], "E" + octave[7], "Gb" + octave[7]}, //B Major 
// //The Following Scales are Harmonic Minor Scales
// {"A" + octave[5], "B" + octave[5], "C" + octave[6], "D" + octave[6], "E" + octave[6], "F" + octave[6], "G#" + octave[6], "A" + octave[6]}, //A Harmonic Minor
// {"Bb" + octave[5], "C" + octave[6], "Db" + octave[6], "Eb" + octave[6], "F" + octave[6], "Gb" + octave[6], "A" + octave[6], "Bb" + octave[6]}, //A# or Bb Harmonic Minor
// {"B" + octave[5], "Db" + octave[6], "D" + octave[6], "E" + octave[6], "Gb" + octave[6], "G" + octave[6], "Bb" + octave[6], "B" + octave[6]}, //B Harmonic Minor
// {"C" + octave[5], "D" + octave[5], "Eb" + octave[5], "F" + octave[5], "G" + octave[5], "Ab" + octave[5], "B" + octave[5], "C" + octave[6]}, //C Harmonic Minor
// {"Db" + octave[5], "Eb" + octave[5], "E" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "A" + octave[5], "C" + octave[6], "Db" + octave[6]}, //C# or Db Harmonic Minor
// {"D" + octave[5], "E" + octave[5], "F" + octave[5], "G" + octave[5], "A" + octave[5], "Bb" + octave[5], "Db" + octave[6], "D" + octave[6]}, //D Harmonic Minor
// {"Eb" + octave[5], "F" + octave[5], "Gb" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "B" + octave[5], "D" + octave[6], "Eb" + octave[6]}, //D# or Eb Harmonic Minor
// {"E" + octave[5], "Gb" + octave[5], "G" + octave[5], "A" + octave[5], "B" + octave[5], "C" + octave[6], "Eb" + octave[6], "E" + octave[6]}, //E Harmonic Minor
// {"F" + octave[5], "G" + octave[5], "Ab" + octave[5], "Bb" + octave[5], "C" + octave[6], "Db" + octave[6], "E" + octave[6], "F" + octave[6]}, //F Harmonic Minor
// {"Gb" + octave[5], "Ab" + octave[5], "A" + octave[5], "B" + octave[5], "Db" + octave[6], "D" + octave[6], "F" + octave[6], "Gb" + octave[6]}, //F# or Gb Harmonic Minor
// {"G" + octave[5], "A" + octave[5], "Bb" + octave[5], "C" + octave[6], "D" + octave[6], "Eb" + octave[6], "Gb" + octave[6], "G" + octave[6]}, //G Harmonic Minor
// {"Ab" + octave[5], "Bb" + octave[5], "B" + octave[5], "Db" + octave[6], "Eb" + octave[6], "E" + octave[6], "G" + octave[6], "Ab" + octave[6]}, //G# or Ab Harmonic Minor
// ////The Chrome Zone
// //{"Ab" + octave[5], "A" + octave[5], "Bb" + octave[5], "B" + octave[5], "C" + octave[6], "Db" + octave[6], "D" + octave[6], "Eb" + octave[6], "E" + octave[6], "F" + octave[6], "Gb" + octave[6], "G" + octave[6]} //Chromatic Scale
// },
// {
// {"Not Actually a Scale"}, 
// {"C" + octave[6], "D" + octave[6], "E" + octave[6], "F" + octave[6], "G" + octave[6], "A" + octave[6], "B" + octave[6], "C" + octave[7], "D" + octave[7], "E" + octave[7], "F" + octave[7], "G" + octave[7]}, //C Major
// {"Db" + octave[6], "Eb" + octave[6], "F" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "C" + octave[7], "Db"  + octave[7], "Eb"  + octave[7], "F"  + octave[7], "Gb"  + octave[7], "Ab" + octave[7]}, //C# or Db Major
// {"D"  + octave[6], "E" + octave[6], "Gb" + octave[6], "G" + octave[6], "A" +  + octave[6], "B" +  + octave[6], "Db" + octave[7], "D" + octave[7], "E" + octave[7], "Gb" + octave[7], "G" + octave[7], "A" + octave[7]}, //D Major
// {"Eb" + octave[6], "F" + octave[6], "G" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "C" + octave[7], "D" + octave[7], "Eb" + octave[7], "F" + octave[7], "G" + octave[7], "Ab" + octave[7], "Bb" + octave[7]}, //D# or Eb Major
// {"E" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "A" + octave[6], "B" + octave[6], "Db" + octave[7], "Eb" + octave[7], "E" + octave[7], "Gb" + octave[7], "Ab" + octave[7], "A" + octave[7], "B" + octave[7]},  //E Major
// {"F" + octave[6], "G" + octave[6], "A" + octave[6], "Bb" + octave[6], "C" + octave[7], "D" + octave[7], "E" + octave[7], "F" + octave[7], "G" + octave[7], "A" + octave[7], "Bb" + octave[7], "C" + octave[8]},  //F Major
// {"Gb" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "B" + octave[6], "Db" + octave[7], "Eb" + octave[7], "F" + octave[7], "Gb" + octave[7], "Ab" + octave[7], "Bb" + octave[7], "B" + octave[7], "Db" + octave[8]}, //F# or Gb Major
// {"G" + octave[6], "A" + octave[6], "B" + octave[6], "C" + octave[7], "D" + octave[7], "E" + octave[7], "Gb" + octave[7], "G" + octave[7], "A" + octave[7], "B" + octave[7], "C" + octave[8], "D" + octave[8]}, //G Major
// {"Ab" + octave[6], "Bb" + octave[6], "C" + octave[7], "Db" + octave[7], "Eb" + octave[7], "F" + octave[7], "G" + octave[7], "Ab" + octave[7], "Bb" + octave[7], "C" + octave[8], "Db" + octave[8], "Eb" + octave[8]}, //G# or Ab Major
// {"A" + octave[6], "B" + octave[6], "Db" + octave[7], "D" + octave[7], "E" + octave[7], "Gb" + octave[7], "Ab" + octave[7], "A" + octave[7], "B" + octave[7], "Db" + octave[8], "D" + octave[8], "E" + octave[8]}, //A Major
// {"Bb" + octave[6], "C" + octave[7], "D" + octave[7], "Eb" + octave[7], "F" + octave[7], "G" + octave[7], "A" + octave[7], "Bb" + octave[7], "C" + octave[8], "D" + octave[8], "Eb" + octave[8], "F" + octave[8]}, //A# or Bb Major
// {"B" + octave[6], "Db" + octave[7], "Eb" + octave[7], "E" + octave[7], "Gb" + octave[7], "Ab" + octave[7], "Bb" + octave[7], "B" + octave[7], "Db" + octave[8], "Eb" + octave[8], "E" + octave[8], "Gb" + octave[8]}, //B Major 
// //The Following Scales are Harmonic Minor Scales
// {"A" + octave[6], "B" + octave[6], "C" + octave[7], "D" + octave[7], "E" + octave[7], "F" + octave[7], "G#" + octave[7], "A" + octave[7]}, //A Harmonic Minor
// {"Bb" + octave[6], "C" + octave[7], "Db" + octave[7], "Eb" + octave[7], "F" + octave[7], "Gb" + octave[7], "A" + octave[7], "Bb" + octave[7]}, //A# or Bb Harmonic Minor
// {"B" + octave[6], "Db" + octave[7], "D" + octave[7], "E" + octave[7], "Gb" + octave[7], "G" + octave[7], "Bb" + octave[7], "B" + octave[7]}, //B Harmonic Minor
// {"C" + octave[6], "D" + octave[6], "Eb" + octave[6], "F" + octave[6], "G" + octave[6], "Ab" + octave[6], "B" + octave[6], "C" + octave[7]}, //C Harmonic Minor
// {"Db" + octave[6], "Eb" + octave[6], "E" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "A" + octave[6], "C" + octave[7], "Db" + octave[7]}, //C# or Db Harmonic Minor
// {"D" + octave[6], "E" + octave[6], "F" + octave[6], "G" + octave[6], "A" + octave[6], "Bb" + octave[6], "Db" + octave[7], "D" + octave[7]}, //D Harmonic Minor
// {"Eb" + octave[6], "F" + octave[6], "Gb" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "B" + octave[6], "D" + octave[7], "Eb" + octave[7]}, //D# or Eb Harmonic Minor
// {"E" + octave[6], "Gb" + octave[6], "G" + octave[6], "A" + octave[6], "B" + octave[6], "C" + octave[7], "Eb" + octave[7], "E" + octave[7]}, //E Harmonic Minor
// {"F" + octave[6], "G" + octave[6], "Ab" + octave[6], "Bb" + octave[6], "C" + octave[7], "Db" + octave[7], "E" + octave[7], "F" + octave[7]}, //F Harmonic Minor
// {"Gb" + octave[6], "Ab" + octave[6], "A" + octave[6], "B" + octave[6], "Db" + octave[7], "D" + octave[7], "F" + octave[7], "Gb" + octave[7]}, //F# or Gb Harmonic Minor
// {"G" + octave[6], "A" + octave[6], "Bb" + octave[6], "C" + octave[7], "D" + octave[7], "Eb" + octave[7], "Gb" + octave[7], "G" + octave[7]}, //G Harmonic Minor
// {"Ab" + octave[6], "Bb" + octave[6], "B" + octave[6], "Db" + octave[7], "Eb" + octave[7], "E" + octave[7], "G" + octave[7], "Ab" + octave[7]}, //G# or Ab Harmonic Minor
// ////The Chrome Zone
// //{"Ab" + octave[6], "A" + octave[6], "Bb" + octave[6], "B" + octave[6], "C" + octave[7], "Db" + octave[7], "D" + octave[7], "Eb" + octave[7], "E" + octave[7], "F" + octave[7], "Gb" + octave[7], "G" + octave[7]} //Chromatic Scale
// }
// };

int numberOfNotes = 20, scale = 1, nextScale;
float duration = 1;
int chordLength = 0;
int chordRoot = 0;
String scaleName[] = {"None", "C Major", "Db Major", "D Major", "Eb Major", "E Major", "F Major", 
  "Gb Major", "G Major", "Ab Major", "A Major", "Bb Major", "B Major", "A Harmonic Minor", 
  "Bb Harmonic Minor", "B Harmonic Minor", "C Harmonic Minor", "Db Harmonic Minor", 
  "D Harmonic Minor", "Eb Harmonic Minor", "E Harmonic Minor", "F Harmonic Minor", 
  "Gb Harmonic Minor", "G Harmonic Minor", "Ab Harmonic Minor"};
  
void GenerateMusic(int tempo, String seq)
{
  music.setTempo(tempo);
  music.pauseNotes();
  
  for (int i = 0; i < seq.length(); i++)
  { 
    //println(note);
    note = seq.charAt(i) - '0';
    
    if (chordLength == 0)
    {
      chordLength = note;
      chordRoot = note;
    }
    
    int third = note + 2;
    int fifth = note + 4;
    music.playNote(i*duration/2, 1.0, cmaj[note]);
    if (chords)
    {
      //if (chordRoot >= scales[selectedOctave-1][scale].length - 2)
      {
        third = chordRoot + 2; //- scales[selectedOctave-1][scale].length;
      }

      //if (chordRoot >= scales[selectedOctave-1][scale].length - 4)
      {
        fifth = chordRoot + 4; //- scales[selectedOctave-1][scale].length;
      }
      
      music.playNote(i*duration/2*chordLength, duration, cmaj[chordRoot]);
      music.playNote(i*duration/2*chordLength, duration, cmaj[third]);
      music.playNote(i*duration/2*chordLength, duration, cmaj[fifth]);
    }
    
    chordLength--;
  }
  
  music.resumeNotes();
}