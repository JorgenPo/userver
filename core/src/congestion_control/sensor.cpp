#include <congestion_control/sensor.hpp>

namespace congestion_control {

double Sensor::Data::GetLoadPercent() const {
  auto total = overload_events_count + no_overload_events_count;
  if (total != 0)
    return static_cast<double>(overload_events_count * 100) / total;
  else
    return 0;
}

}  // namespace congestion_control