defmodule Fw do
  @moduledoc """
  This application is used to build the firmware that will run on the device.

  This app includes the path dependency to the Phoenix application that is the
  user interface. There are config options set in this application that are
  required in order to start the Phoenix server when the fw app starts.

  This app also includes the libraries used to communicate with the thermometer
  and the fan.
  """
end
