# Set Rack timeout to kill long-running processes
# so Puma doesn't keep trying forever
Rack::Timeout.timeout = 20  # seconds