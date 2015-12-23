<a name="assoc" />
## Associating an extension with an exectuable

In order to associate an extension with an executable, c key with a dot and the extension needs to be created (for example [.pl](https://github.com/ReneNyffenegger/about-Windows-Registry/tree/master/HKEY_CURRENT_USER/Software/Classes/.pl)).

This Key's [default value](https://github.com/ReneNyffenegger/about-Windows-Registry/blob/master/HKEY_CURRENT_USER/Software/Classes/.pl/default)
contains a string that names another key (for example [Perl_program_file](https://github.com/ReneNyffenegger/about-Windows-Registry/tree/master/HKEY_CURRENT_USER/Software/Classes/Perl_program_file).
This other key contains the key [shell](https://github.com/ReneNyffenegger/about-Windows-Registry/tree/master/HKEY_CURRENT_USER/Software/Classes/Perl_program_file/shell)
which contains the key [open](https://github.com/ReneNyffenegger/about-Windows-Registry/tree/master/HKEY_CURRENT_USER/Software/Classes/Perl_program_file/shell/open)
which contains the key [command](https://github.com/ReneNyffenegger/about-Windows-Registry/tree/master/HKEY_CURRENT_USER/Software/Classes/Perl_program_file/shell/open/command)
whose [default value](https://github.com/ReneNyffenegger/about-Windows-Registry/blob/master/HKEY_CURRENT_USER/Software/Classes/Perl_program_file/shell/open/command/default)
determines what program is associated with the exention.
