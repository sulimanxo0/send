#!/usr/local/bin/perl
     
    $ARGC=@ARGV;
    if ($ARGC !=4) {
       printf "Você digitou de uma forma errada. Siga as instruções.\n";
       printf "INSTRUÇÕES - UND3F1N3D\n";
       printf "perl $0 <mailist> <remetente\@mail.com> <assunto> <corpo.html>\n";
       printf "Exemplo: perl $0 lista01.txt peu\@msn.com Ola index.html\n";
       exit(1);
    }
     
    $mailtype = "content-type: text/html";
    $sendmail = '/usr/sbin/sendmail';
    $sender = $ARGV[1];
    $subject = $ARGV[2];
    $efile = $ARGV[0];
    $emar = $ARGV[0];
    open(FOO, $ARGV[3]);
    @foo = <FOO>;
    $corpo = join("\n", @foo);
    open (BANDFIT, "$emar") || die "Can't Open $emar";
    $cont=0;
     
    while(<BANDFIT>) {
       ($ID,$options) = split(/\|/,$_);
       chop($options);
       foreach ($ID) {
          $recipient = $ID;
          open (SENDMAIL, "| $sendmail -t");
          print SENDMAIL "$mailtype\n";
          print SENDMAIL "Subject: $subject\n";
          print SENDMAIL "From: $sender\n";
          print SENDMAIL "To: $recipient\n\n";
          print SENDMAIL "$corpo\n\n";
          close (SENDMAIL);
          $cont=$cont+1;
          printf "$cont Enviado para $recipient";
       }
    }
    close(BANDFIT);