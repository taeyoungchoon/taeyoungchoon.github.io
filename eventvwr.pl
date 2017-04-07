use Win32::EventLog;

 $handle=Win32::EventLog->new("System", $ENV{ComputerName})
        or die "Can't open Application EventLog\n";
 $handle->GetNumber($recs)
        or die "Can't get number of EventLog records\n";
 $handle->GetOldest($base)
        or die "Can't get number of oldest EventLog record\n";

 while ($x < $recs) {
        $handle->Read(EVENTLOG_FORWARDS_READ|EVENTLOG_SEEK_READ,
                                  $base+$x,
                                  $hashRef)
                or die "Can't read EventLog entry #$x\n";
        if ($hashRef->{Source} eq "EventLog") {
                Win32::EventLog::GetMessageText($hashRef);
                print "Entry $x: $hashRef->{Message}\n";
        }
        $x++;
 }
