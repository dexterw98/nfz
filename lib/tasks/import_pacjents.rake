namespace :import do
  desc 'Import users from CSV'
  task pacjents: :environment do
    require 'csv'
    csv_file = './fake_medical_patients.csv'

    CSV.foreach(csv_file, headers: true) do |row|
      Pacjent.create!(extract_pacjent_attributes(row))
    end

    puts 'Users imported successfully!'
  end
end

private

def extract_pacjent_attributes(row)
  pesel_dane = odczytaj_pesel(row['pesel'])
  {
    imie: row['first_name'].capitalize,
    nazwisko: row['last_name'].capitalize,
    miasto: row['city'].capitalize,
    pesel: row['pesel'],
    urodziny: pesel_dane[:data_urodzenia],
    plec: pesel_dane[:plec]
  }
end

def odczytaj_pesel(pesel)
  return nil unless pesel.match?(/^\d{11}$/)

  rok = pesel[0..1]
  miesiac = pesel[2..3]
  dzien = pesel[4..5]
  data_urodzenia = "#{(rok.to_i < 20 ? '20' : '19') + rok}-#{miesiac}-#{dzien}"
  plec = pesel[9].to_i.even? ? 'K' : 'M'

  { data_urodzenia: data_urodzenia, plec: plec }
end
