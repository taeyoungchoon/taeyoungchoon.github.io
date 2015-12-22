#!/usr/bin/emacs --script

(require 'calendar)

; Use current date if no date is given on the command line
(if (= 3 (length command-line-args-left))
 (setq my-date (mapcar 'string-to-int command-line-args-left))
 (setq my-date (calendar-current-date)))

; Make the conversions and print the results
(princ
  (concat
    "Gregorian:  " (calendar-date-string          my-date)  "\n"
    "      ISO:  " (calendar-iso-date-string      my-date)  "\n"
    "    Mayan:  " (calendar-mayan-date-string    my-date)  "\n" ))


