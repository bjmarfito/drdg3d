function map = whitejet(m)
%   COOLWARM(M) returns an M-by-3 matrix containing a colormap
%   For example, to reset the colormap of the current figure:
%
%             colormap(whitejet)
%
% Wenqiang Zhang
% McGill University
% Jan 5 2023
% 
% im=imread('rate_color.png');
% c=squeeze(double(im(fix(end/2),:,:)));
% (or)
% c=squeeze(double(:,im(fix(end/2),:)));

%% Check inputs
narginchk(0,1);

if nargin == 1
    validateattributes(m,{'numeric'},{'numel',1});
end

%% Begin Function
if nargin < 1, m = size(get(gcf,'colormap'),1); end
c=[...
255 255 255;
251 253 255;
245 251 255;
234 248 255;
225 246 255;
214 243 255;
204 240 255;
197 236 254;
186 234 254;
177 232 255;
167 227 255;
155 224 254;
142 221 254;
132 220 254;
121 216 255;
113 213 254;
105 209 254;
95 207 254;
84 204 252;
75 201 254;
67 197 255;
56 194 255;
41 191 253;
31 188 252;
23 185 254;
12 184 254;
3 181 254;
0 181 255;
2 181 255;
4 185 253;
3 188 250;
4 191 249;
6 195 250;
7 198 249;
8 202 248;
9 205 247;
10 208 245;
11 210 244;
12 213 244;
13 216 242;
14 218 242;
15 221 242;
15 224 238;
17 229 238;
19 232 236;
20 236 235;
21 237 235;
23 240 233;
22 243 234;
22 246 234;
23 250 233;
25 252 230;
28 254 226;
33 254 222;
36 254 219;
39 255 216;
42 255 213;
45 255 208;
51 255 204;
56 255 199;
60 254 195;
63 254 192;
67 254 186;
72 254 181;
76 255 180;
80 255 176;
83 255 171;
88 254 166;
92 254 163;
96 254 161;
100 253 157;
103 254 151;
107 255 145;
111 255 142;
116 255 140;
121 254 136;
124 254 131;
127 254 125;
133 254 122;
135 254 120;
139 254 116;
143 255 110;
149 254 106;
155 254 101;
158 255 97;
159 255 93;
163 255 90;
169 254 88;
173 253 84;
176 254 79;
178 255 74;
183 255 69;
188 254 67;
194 254 62;
198 255 58;
200 255 54;
204 255 50;
209 255 46;
214 255 42;
217 255 37;
219 255 36;
224 255 30;
229 253 27;
233 248 25;
234 241 21;
234 238 21;
236 233 19;
240 225 15;
242 220 13;
245 214 12;
245 208 9;
246 202 7;
249 195 6;
251 187 3;
255 180 1;
255 174 0;
254 168 0;
253 160 0;
254 152 0;
255 144 1;
255 136 2;
254 128 2;
254 119 1;
255 108 0;
255 100 0;
255 94 0;
254 88 0;
254 81 0;
254 75 0;
253 71 1;
252 67 1;
251 65 1;
251 61 1;
249 58 1;
248 55 0;
246 52 0;
246 50 0;
244 46 0;
243 44 0;
243 42 1;
241 37 0;
240 35 0;
238 31 0;
237 28 0;
237 25 0;
237 22 0;
235 19 0;
235 17 0;
235 14 0;
234 11 0;
232 7 0;
229 4 0;
227 1 0;
225 0 1;
222 0 0;
218 0 0;
214 0 0;
212 0 0;
207 0 0;
203 1 0;
199 0 1;
194 0 0;
191 0 0;
185 0 0;
182 0 0;
179 0 0;
174 0 0;
169 0 0;
166 0 0;
163 0 1;
160 0 0;
154 0 1;
151 0 0;
146 0 0;
142 0 0;
138 1 1;
133 0 1;
129 0 0;
126 1 0;
122 0 1;
116 0 0;
110 0 0;
105 0 0;
99 0 1;
93 0 1;
89 0 0;
84 0 0;
80 0 0;
76 0 0;
71 0 0;
65 0 0;
59 1 0;
55 0 0;
51 0 0;
45 0 0;
39 0 0;
32 1 0;
28 0 0;
26 0 1;
19 0 1;
13 0 0;
6 0 0;
0 0 0;
];
c = [repmat(c(1,:),2,1);c;repmat(c(1,:),1,1)];
%... Interpolate get requested size for color table
pp=1:(m-1)/(size(c,1)-1):m;
r=interp1(pp,c(:,1),1:m);
g=interp1(pp,c(:,2),1:m);
b=interp1(pp,c(:,3),1:m);
%... Normalize to range [0,1], and divide again by maximum value
% to correct for round-off errors associated with the interpolation.
map=[r' g' b']/255;
map = map/max(map(:));
