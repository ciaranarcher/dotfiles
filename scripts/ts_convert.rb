times = ['5h 33m 5s',
         '54m 27s',
         '1h 24m 8s',
         '7h 49m 46s',
         '5h 37m 53s',
         '4h 50m 25s',
         '1d 2h 41m 1s',
         '34m 33s']

times.each do |t|
  parts = t.split(' ')

  num_secs = case parts.length
             when 1
               secs =  parts[0][0...-1].to_i
               secs
             when 2
               mins = parts[0][0...-1].to_i
               secs =  parts[1][0...-1].to_i
               (mins * 60) + secs
             when 3
               hours = parts[0][0...-1].to_i
               mins = parts[1][0...-1].to_i
               secs = parts[2][0...-1].to_i
               (hours * 60 * 60) + (mins * 60) + secs
             when 4
               days = parts[0][0...-1].to_i
               hours = parts[1][0...-1].to_i
               mins = parts[1][0...-1].to_i
               secs =  parts[3][0...-1].to_i
               (days * 24 * 60 * 60) + (hours * 60 * 60) + (mins * 60) + secs
             end

  puts "#{t} in seconds: #{num_secs}"
end
