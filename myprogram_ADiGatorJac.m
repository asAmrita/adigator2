% This code was generated using ADiGator version 1.4
% ©2010-2014 Matthew J. Weinstein and Anil V. Rao
% ADiGator may be obtained at https://sourceforge.net/projects/adigator/ 
% Contact: mweinstein@ufl.edu
% Bugs/suggestions may be reported to the sourceforge forums
%                    DISCLAIMER
% ADiGator is a general-purpose software distributed under the GNU General
% Public License version 3.0. While the software is distributed with the
% hope that it will be useful, both the software and generated code are
% provided 'AS IS' with NO WARRANTIES OF ANY KIND and no merchantability
% or fitness for any purpose or application.

function p = myprogram_ADiGatorJac(x,d)
global ADiGator_myprogram_ADiGatorJac
if isempty(ADiGator_myprogram_ADiGatorJac); ADiGator_LoadData(); end
Gator1Data = ADiGator_myprogram_ADiGatorJac.myprogram_ADiGatorJac.Gator1Data;
% ADiGator Start Derivative Computations
%User Line: % FIT -- Given x and d, fit() returns p
%User Line: % such that norm(V*p-d) = min, where
%User Line: % V = [1, x, x.^2, ... x.^(m-1)].
y.dx = 4.*x.f(:).^(4-1).*x.dx;
y.f = x.f.^4;
%User Line: y=x.^4;
cada1f1dx = 2.*y.f(:).^(2-1).*y.dx;
cada1f1 = y.f.^2;
V.dx = cada1f1dx;
V.f = 1 + cada1f1;
%User Line: V=1+y.^2;
cada1tf3 = V.f\d;
cada1td1 = zeros(1,100);
cada1td1(Gator1Data.Index1) = V.dx;
cada1td1 = cada1tf3.'*cada1td1;
cada1td1 = cada1td1(:);
cada1td3 = cada1td1(Gator1Data.Index2);
cada1tf4 = V.f.';
cada1td1 = sparse(Gator1Data.Index3,Gator1Data.Index4,cada1td3,100,100);
cada1td1 = cada1tf4*cada1td1;
cada1td1 = cada1td1(:);
cada1td4 = full(cada1td1(Gator1Data.Index5));
cada1tf4 = (V.f*cada1tf3 - d).';
cada1td1 = sparse(Gator1Data.Index6,Gator1Data.Index7,V.dx,100,100);
cada1td1 = cada1tf4*cada1td1;
cada1td1 = cada1td1(:);
cada1td5 = full(cada1td1(Gator1Data.Index8));
cada1td3 = cada1td4 + cada1td5;
cada1tf4 = -(V.f.'*V.f);
cada1td1 = zeros(1,100);
cada1td1(Gator1Data.Index9) = cada1td3;
cada1td1 = cada1tf4\cada1td1;
cada1td1 = cada1td1(:);
p.dx = cada1td1(Gator1Data.Index10);
p.f = cada1tf3;
%User Line: p = V\d
p.dx_size = 100;
p.dx_location = Gator1Data.Index11;
end


function ADiGator_LoadData()
global ADiGator_myprogram_ADiGatorJac
ADiGator_myprogram_ADiGatorJac = load('myprogram_ADiGatorJac.mat');
return
end