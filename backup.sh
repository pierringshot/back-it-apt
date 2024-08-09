#!/bin/bash
# Bütün quraşdırılmış paketlərin siyahısını çıxarır
dpkg --get-selections > apt-package-list.txt
echo "Harda dəməy apt paketi varsa tapıb yükləmisən. Nəysə day hamsını apt-package-list.txt adlı fayla şaqqaladım yetka."
