about-Windows-Registry
======================

Windows Registry

# Misc

With [Powershell](https://github.com/ReneNyffenegger/about-powershell), its possible to navigate the registry:

<pre>PS C:&gt; <b>Set-Location Set-Location HKCU:\Software\Microsoft\Windows</b>
PS HKCU:\Software\Microsoft\Windows&gt; Get-ChildItem

    Hive: HKEY_CURRENT_USER\Software\Microsoft\Windows


SKC  VC Name                           Property
---  -- ----                           --------
 30   1 CurrentVersion                 {%a5%81%f7%c2%5b%bc%0b%ad%56%96%ee%4a%2c%67%2e%b4%a0%bf%d2%f1%d7%2a%2b%20%9e%c0%94%7b%66%ad%64%58}
  0  12 DWM                            {Composition, CompositionPolicy, ColorizationColor, ColorizationColorBalance...}
  4   0 Shell                          {}
  2   0 TabletPC                       {}
  4  12 Windows Error Reporting        {ConfigureArchive, DisableArchive, Disabled, DisableQueue...}
</pre>

# Links

[Offline NT Password & Registry Editor](http://pogostick.net/~pnh/ntpasswd/) is a utility that is able to reset the Password of any user.

[Registry Edits](http://www.theeldergeek.com/registry_edits.htm).
