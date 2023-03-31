SELECT 'The time is ' || time('now');
SELECT 'Tomorrow will be ' || date('now', '+1 day');
SELECT 'Today is day ' ||
  (cast(
      julianday('now')
      - julianday('now', 'start of year')
    as int) + 1)
  || ' of ' || strftime('%Y', date('now'));
