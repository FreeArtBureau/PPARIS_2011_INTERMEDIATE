//------------------------------------------------------------
// class Timer
//------------------------------------------------------------
class Timer
{
  float t;
  Timer(){
    t = millis();
  }
    
  float getDeltaSeconds()
  {
    float dt = millis() - t;
    t = millis();
    return dt/1000.0f;
  }
};
