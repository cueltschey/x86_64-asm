	.file	"lex.yy.c"
	.text
	.local	yy_buffer_stack_top
	.comm	yy_buffer_stack_top,8,8
	.local	yy_buffer_stack_max
	.comm	yy_buffer_stack_max,8,8
	.local	yy_buffer_stack
	.comm	yy_buffer_stack,8,8
	.local	yy_hold_char
	.comm	yy_hold_char,1,1
	.local	yy_n_chars
	.comm	yy_n_chars,4,4
	.globl	yyleng
	.bss
	.align 4
	.type	yyleng, @object
	.size	yyleng, 4
yyleng:
	.zero	4
	.local	yy_c_buf_p
	.comm	yy_c_buf_p,8,8
	.local	yy_init
	.comm	yy_init,4,4
	.local	yy_start
	.comm	yy_start,4,4
	.local	yy_did_buffer_switch_on_eof
	.comm	yy_did_buffer_switch_on_eof,4,4
	.globl	yyin
	.align 8
	.type	yyin, @object
	.size	yyin, 8
yyin:
	.zero	8
	.globl	yyout
	.align 8
	.type	yyout, @object
	.size	yyout, 8
yyout:
	.zero	8
	.globl	yylineno
	.data
	.align 4
	.type	yylineno, @object
	.size	yylineno, 4
yylineno:
	.long	1
	.section	.rodata
	.align 32
	.type	yy_accept, @object
	.size	yy_accept, 1334
yy_accept:
	.value	0
	.value	0
	.value	0
	.value	216
	.value	214
	.value	1
	.value	9
	.value	214
	.value	214
	.value	214
	.value	214
	.value	204
	.value	205
	.value	199
	.value	203
	.value	214
	.value	209
	.value	209
	.value	213
	.value	214
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	1
	.value	0
	.value	206
	.value	0
	.value	210
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	207
	.value	0
	.value	201
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	209
	.value	0
	.value	213
	.value	213
	.value	0
	.value	0
	.value	0
	.value	212
	.value	211
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	93
	.value	95
	.value	97
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	58
	.value	42
	.value	59
	.value	48
	.value	43
	.value	60
	.value	75
	.value	44
	.value	47
	.value	61
	.value	76
	.value	45
	.value	0
	.value	0
	.value	0
	.value	0
	.value	77
	.value	78
	.value	79
	.value	0
	.value	18
	.value	19
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	46
	.value	49
	.value	80
	.value	0
	.value	201
	.value	197
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	208
	.value	213
	.value	0
	.value	0
	.value	0
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	82
	.value	83
	.value	212
	.value	212
	.value	212
	.value	96
	.value	98
	.value	92
	.value	94
	.value	212
	.value	212
	.value	212
	.value	212
	.value	178
	.value	212
	.value	137
	.value	135
	.value	134
	.value	136
	.value	212
	.value	212
	.value	91
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	64
	.value	63
	.value	26
	.value	32
	.value	27
	.value	28
	.value	31
	.value	29
	.value	30
	.value	33
	.value	20
	.value	21
	.value	22
	.value	23
	.value	24
	.value	25
	.value	66
	.value	34
	.value	50
	.value	67
	.value	35
	.value	51
	.value	10
	.value	16
	.value	11
	.value	12
	.value	15
	.value	13
	.value	74
	.value	14
	.value	17
	.value	62
	.value	65
	.value	0
	.value	195
	.value	196
	.value	0
	.value	0
	.value	186
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	213
	.value	200
	.value	0
	.value	0
	.value	212
	.value	109
	.value	107
	.value	106
	.value	108
	.value	133
	.value	131
	.value	130
	.value	132
	.value	90
	.value	81
	.value	173
	.value	171
	.value	170
	.value	172
	.value	125
	.value	123
	.value	122
	.value	124
	.value	212
	.value	212
	.value	104
	.value	103
	.value	212
	.value	105
	.value	102
	.value	100
	.value	99
	.value	101
	.value	117
	.value	115
	.value	114
	.value	116
	.value	149
	.value	147
	.value	146
	.value	148
	.value	145
	.value	143
	.value	142
	.value	144
	.value	88
	.value	87
	.value	89
	.value	86
	.value	84
	.value	165
	.value	163
	.value	162
	.value	164
	.value	169
	.value	167
	.value	166
	.value	168
	.value	161
	.value	159
	.value	158
	.value	160
	.value	153
	.value	151
	.value	150
	.value	152
	.value	157
	.value	155
	.value	154
	.value	156
	.value	113
	.value	111
	.value	110
	.value	112
	.value	212
	.value	212
	.value	141
	.value	139
	.value	138
	.value	140
	.value	0
	.value	0
	.value	68
	.value	36
	.value	52
	.value	69
	.value	37
	.value	53
	.value	70
	.value	38
	.value	54
	.value	71
	.value	39
	.value	55
	.value	72
	.value	40
	.value	56
	.value	73
	.value	41
	.value	57
	.value	0
	.value	192
	.value	0
	.value	0
	.value	185
	.value	181
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	188
	.value	0
	.value	183
	.value	191
	.value	213
	.value	0
	.value	0
	.value	212
	.value	129
	.value	127
	.value	126
	.value	128
	.value	121
	.value	119
	.value	118
	.value	120
	.value	180
	.value	85
	.value	212
	.value	177
	.value	175
	.value	174
	.value	176
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	193
	.value	194
	.value	190
	.value	8
	.value	0
	.value	0
	.value	0
	.value	0
	.value	213
	.value	213
	.value	213
	.value	213
	.value	0
	.value	0
	.value	212
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	8
	.value	0
	.value	184
	.value	0
	.value	189
	.value	213
	.value	213
	.value	213
	.value	213
	.value	0
	.value	0
	.value	212
	.value	212
	.value	212
	.value	212
	.value	179
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	182
	.value	213
	.value	213
	.value	213
	.value	213
	.value	0
	.value	0
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	213
	.value	213
	.value	213
	.value	213
	.value	198
	.value	202
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	0
	.value	213
	.value	213
	.value	213
	.value	213
	.value	212
	.value	212
	.value	212
	.value	212
	.value	0
	.value	0
	.value	4
	.value	0
	.value	0
	.value	0
	.value	4
	.value	0
	.value	0
	.value	0
	.value	4
	.value	0
	.value	0
	.value	213
	.value	213
	.value	4
	.value	213
	.value	212
	.value	212
	.value	4
	.value	212
	.value	6
	.value	7
	.value	4
	.value	0
	.value	6
	.value	7
	.value	4
	.value	4
	.value	0
	.value	6
	.value	7
	.value	4
	.value	4
	.value	0
	.value	0
	.value	6
	.value	7
	.value	4
	.value	213
	.value	6
	.value	7
	.value	4
	.value	4
	.value	212
	.value	6
	.value	6
	.value	0
	.value	6
	.value	6
	.value	6
	.value	0
	.value	6
	.value	6
	.value	6
	.value	0
	.value	0
	.value	6
	.value	6
	.value	213
	.value	6
	.value	6
	.value	6
	.value	212
	.value	6
	.value	6
	.value	2
	.value	6
	.value	6
	.value	2
	.value	6
	.value	6
	.value	2
	.value	0
	.value	6
	.value	6
	.value	2
	.value	6
	.value	6
	.value	2
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	187
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	6
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	3
	.value	6
	.value	3
	.value	3
	.value	6
	.value	3
	.value	6
	.value	3
	.value	3
	.value	6
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	5
	.value	0
	.align 32
	.type	yy_ec, @object
	.size	yy_ec, 256
yy_ec:
	.string	""
	.ascii	"\001\001\001\001\001\001\001\001\002\003\001\001\002\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\002\001\004\001\005\006\001\007\b\t\001\001\n\013\f\001"
	.ascii	"\r\016\017\020\021\022\023\023\024\025\026\027\001\001\001\001"
	.ascii	"\030\031\032\033\031\034\035\036\037\037\037\037 \037!\037\""
	.ascii	"\037\037\037#$\037\037\037\037\037\001\001\001\001%\001&'()*"
	.ascii	"+,-./0123456789:;<=>?\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001\001\001"
	.align 32
	.type	yy_meta, @object
	.size	yy_meta, 64
yy_meta:
	.string	""
	.ascii	"\001\001\002\001\001\001\001\001\001\001\001\001\003\003\003"
	.ascii	"\003\003\003\003\003\003\004\001\001\005\005\006\005\006\007"
	.ascii	"\007\007\007\007\007\007\007\005\005\b\005\005\005\007\007\007"
	.ascii	"\007\007\007\007\007\007\007\007\007\007\007\007\007\007\t\007"
	.ascii	"\007"
	.align 32
	.type	yy_base, @object
	.size	yy_base, 1400
yy_base:
	.value	0
	.value	0
	.value	0
	.value	1419
	.value	1378
	.value	62
	.value	1420
	.value	61
	.value	1377
	.value	28
	.value	66
	.value	1376
	.value	1375
	.value	1374
	.value	1373
	.value	96
	.value	34
	.value	35
	.value	1372
	.value	45
	.value	54
	.value	59
	.value	65
	.value	71
	.value	68
	.value	82
	.value	101
	.value	98
	.value	122
	.value	90
	.value	126
	.value	127
	.value	132
	.value	133
	.value	94
	.value	1368
	.value	1408
	.value	1405
	.value	1420
	.value	78
	.value	182
	.value	28
	.value	110
	.value	161
	.value	159
	.value	173
	.value	1352
	.value	1351
	.value	204
	.value	112
	.value	1399
	.value	1420
	.value	84
	.value	0
	.value	51
	.value	1349
	.value	1366
	.value	1357
	.value	1353
	.value	1360
	.value	1348
	.value	1347
	.value	134
	.value	119
	.value	217
	.value	0
	.value	0
	.value	1355
	.value	1365
	.value	1338
	.value	1340
	.value	1372
	.value	1420
	.value	70
	.value	165
	.value	166
	.value	160
	.value	103
	.value	163
	.value	199
	.value	164
	.value	206
	.value	135
	.value	1371
	.value	197
	.value	204
	.value	205
	.value	219
	.value	225
	.value	226
	.value	227
	.value	231
	.value	233
	.value	234
	.value	240
	.value	235
	.value	232
	.value	243
	.value	242
	.value	246
	.value	245
	.value	244
	.value	247
	.value	249
	.value	1346
	.value	266
	.value	1420
	.value	1420
	.value	1420
	.value	1342
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1341
	.value	1420
	.value	1420
	.value	1420
	.value	1328
	.value	219
	.value	1327
	.value	213
	.value	253
	.value	1420
	.value	1420
	.value	300
	.value	266
	.value	269
	.value	1326
	.value	226
	.value	1325
	.value	235
	.value	1332
	.value	256
	.value	1335
	.value	1334
	.value	1420
	.value	275
	.value	0
	.value	298
	.value	317
	.value	296
	.value	1326
	.value	1324
	.value	1331
	.value	1327
	.value	1336
	.value	1320
	.value	1335
	.value	1335
	.value	1311
	.value	1318
	.value	1311
	.value	1318
	.value	0
	.value	1324
	.value	1334
	.value	1317
	.value	1315
	.value	297
	.value	301
	.value	317
	.value	319
	.value	306
	.value	320
	.value	1344
	.value	1343
	.value	324
	.value	289
	.value	323
	.value	1342
	.value	1341
	.value	1340
	.value	1339
	.value	327
	.value	336
	.value	340
	.value	343
	.value	1338
	.value	366
	.value	1337
	.value	1336
	.value	1335
	.value	1334
	.value	369
	.value	322
	.value	1333
	.value	373
	.value	382
	.value	385
	.value	389
	.value	408
	.value	415
	.value	330
	.value	342
	.value	422
	.value	1317
	.value	356
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	375
	.value	407
	.value	412
	.value	417
	.value	424
	.value	439
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	346
	.value	1420
	.value	1331
	.value	472
	.value	487
	.value	1420
	.value	1314
	.value	1309
	.value	1311
	.value	1298
	.value	1306
	.value	1309
	.value	1289
	.value	1303
	.value	1298
	.value	1286
	.value	1300
	.value	1304
	.value	1420
	.value	1300
	.value	1295
	.value	376
	.value	1316
	.value	1315
	.value	1314
	.value	1313
	.value	1312
	.value	1311
	.value	1310
	.value	1309
	.value	1308
	.value	1307
	.value	1306
	.value	1305
	.value	1304
	.value	1303
	.value	1302
	.value	1301
	.value	1300
	.value	1299
	.value	472
	.value	473
	.value	1298
	.value	1297
	.value	410
	.value	1296
	.value	1295
	.value	1294
	.value	1293
	.value	1292
	.value	1291
	.value	1290
	.value	1289
	.value	1288
	.value	1287
	.value	1286
	.value	1285
	.value	1284
	.value	1283
	.value	1282
	.value	1281
	.value	1280
	.value	1279
	.value	1278
	.value	1277
	.value	1276
	.value	75
	.value	1275
	.value	1274
	.value	1273
	.value	1272
	.value	1271
	.value	1270
	.value	1269
	.value	1268
	.value	1267
	.value	1266
	.value	1265
	.value	1264
	.value	1263
	.value	1262
	.value	1261
	.value	1260
	.value	1259
	.value	1258
	.value	1257
	.value	1256
	.value	1255
	.value	1254
	.value	1253
	.value	1252
	.value	379
	.value	474
	.value	1251
	.value	1250
	.value	1249
	.value	1248
	.value	418
	.value	494
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	1420
	.value	502
	.value	1420
	.value	1247
	.value	1246
	.value	1420
	.value	1420
	.value	1218
	.value	1209
	.value	1253
	.value	1207
	.value	1217
	.value	1420
	.value	1211
	.value	1420
	.value	1420
	.value	473
	.value	1204
	.value	1221
	.value	496
	.value	1237
	.value	1236
	.value	1235
	.value	1234
	.value	1233
	.value	1232
	.value	1231
	.value	1230
	.value	1229
	.value	1228
	.value	461
	.value	1227
	.value	1226
	.value	1225
	.value	1224
	.value	1203
	.value	1193
	.value	1200
	.value	1185
	.value	398
	.value	415
	.value	477
	.value	353
	.value	399
	.value	466
	.value	512
	.value	490
	.value	1420
	.value	1420
	.value	1420
	.value	0
	.value	1211
	.value	1202
	.value	1187
	.value	1194
	.value	1195
	.value	1185
	.value	1192
	.value	1177
	.value	1187
	.value	1186
	.value	509
	.value	428
	.value	502
	.value	508
	.value	517
	.value	1188
	.value	1189
	.value	1186
	.value	1183
	.value	536
	.value	512
	.value	537
	.value	538
	.value	542
	.value	549
	.value	550
	.value	553
	.value	0
	.value	1179
	.value	1420
	.value	1134
	.value	1420
	.value	1133
	.value	1126
	.value	1097
	.value	1093
	.value	1070
	.value	1038
	.value	539
	.value	537
	.value	540
	.value	387
	.value	1064
	.value	1040
	.value	997
	.value	985
	.value	977
	.value	559
	.value	560
	.value	563
	.value	565
	.value	561
	.value	563
	.value	565
	.value	567
	.value	993
	.value	1420
	.value	989
	.value	972
	.value	948
	.value	945
	.value	948
	.value	942
	.value	549
	.value	551
	.value	553
	.value	555
	.value	957
	.value	930
	.value	942
	.value	926
	.value	577
	.value	580
	.value	583
	.value	584
	.value	587
	.value	582
	.value	588
	.value	585
	.value	971
	.value	928
	.value	912
	.value	924
	.value	908
	.value	1420
	.value	1420
	.value	575
	.value	577
	.value	581
	.value	579
	.value	921
	.value	911
	.value	905
	.value	908
	.value	596
	.value	598
	.value	601
	.value	602
	.value	600
	.value	601
	.value	604
	.value	607
	.value	904
	.value	907
	.value	892
	.value	886
	.value	889
	.value	590
	.value	596
	.value	602
	.value	604
	.value	903
	.value	900
	.value	0
	.value	884
	.value	624
	.value	625
	.value	274
	.value	627
	.value	631
	.value	627
	.value	637
	.value	638
	.value	881
	.value	899
	.value	896
	.value	0
	.value	871
	.value	625
	.value	624
	.value	693
	.value	629
	.value	883
	.value	1420
	.value	0
	.value	867
	.value	669
	.value	914
	.value	667
	.value	0
	.value	662
	.value	649
	.value	910
	.value	671
	.value	0
	.value	661
	.value	878
	.value	878
	.value	0
	.value	0
	.value	862
	.value	717
	.value	891
	.value	754
	.value	0
	.value	627
	.value	0
	.value	137
	.value	872
	.value	672
	.value	0
	.value	727
	.value	650
	.value	674
	.value	0
	.value	680
	.value	702
	.value	862
	.value	0
	.value	299
	.value	856
	.value	782
	.value	0
	.value	633
	.value	667
	.value	851
	.value	851
	.value	1420
	.value	707
	.value	730
	.value	888
	.value	705
	.value	766
	.value	884
	.value	841
	.value	845
	.value	836
	.value	0
	.value	831
	.value	830
	.value	848
	.value	825
	.value	822
	.value	742
	.value	767
	.value	792
	.value	793
	.value	1420
	.value	821
	.value	818
	.value	818
	.value	816
	.value	803
	.value	812
	.value	688
	.value	734
	.value	746
	.value	794
	.value	801
	.value	810
	.value	798
	.value	807
	.value	810
	.value	790
	.value	771
	.value	764
	.value	800
	.value	807
	.value	794
	.value	775
	.value	782
	.value	766
	.value	755
	.value	752
	.value	812
	.value	814
	.value	816
	.value	818
	.value	741
	.value	724
	.value	700
	.value	679
	.value	0
	.value	678
	.value	748
	.value	823
	.value	740
	.value	825
	.value	0
	.value	654
	.value	875
	.value	638
	.value	0
	.value	400
	.value	826
	.value	0
	.value	835
	.value	838
	.value	0
	.value	840
	.value	0
	.value	128
	.value	899
	.value	0
	.value	31
	.value	0
	.value	830
	.value	841
	.value	0
	.value	923
	.value	0
	.value	846
	.value	0
	.value	848
	.value	0
	.value	0
	.value	947
	.value	0
	.value	1420
	.value	971
	.value	978
	.value	986
	.value	993
	.value	1002
	.value	1009
	.value	1014
	.value	1021
	.value	1025
	.value	1031
	.value	1033
	.value	1035
	.value	1039
	.value	1048
	.value	1057
	.value	1066
	.value	1075
	.value	1084
	.value	1093
	.value	1102
	.value	1111
	.value	1120
	.value	1129
	.value	1138
	.value	1147
	.value	1156
	.value	1165
	.value	1174
	.value	1183
	.value	1192
	.value	1201
	.value	1210
	.value	1219
	.align 32
	.type	yy_def, @object
	.size	yy_def, 1400
yy_def:
	.value	0
	.value	666
	.value	1
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	668
	.value	666
	.value	669
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	670
	.value	670
	.value	671
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	667
	.value	666
	.value	667
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	669
	.value	666
	.value	669
	.value	673
	.value	674
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	675
	.value	671
	.value	671
	.value	666
	.value	666
	.value	666
	.value	672
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	667
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	669
	.value	673
	.value	674
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	675
	.value	671
	.value	666
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	667
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	669
	.value	666
	.value	676
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	671
	.value	666
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	667
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	669
	.value	666
	.value	677
	.value	678
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	671
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	667
	.value	667
	.value	667
	.value	669
	.value	669
	.value	669
	.value	669
	.value	666
	.value	666
	.value	666
	.value	679
	.value	666
	.value	666
	.value	666
	.value	666
	.value	671
	.value	671
	.value	671
	.value	671
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	667
	.value	667
	.value	667
	.value	669
	.value	669
	.value	669
	.value	669
	.value	679
	.value	666
	.value	666
	.value	666
	.value	666
	.value	671
	.value	671
	.value	671
	.value	671
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	667
	.value	667
	.value	667
	.value	669
	.value	669
	.value	669
	.value	669
	.value	666
	.value	666
	.value	671
	.value	671
	.value	671
	.value	671
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	667
	.value	667
	.value	667
	.value	669
	.value	669
	.value	669
	.value	669
	.value	666
	.value	671
	.value	671
	.value	671
	.value	671
	.value	666
	.value	666
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	666
	.value	666
	.value	667
	.value	667
	.value	667
	.value	667
	.value	669
	.value	669
	.value	669
	.value	669
	.value	666
	.value	671
	.value	671
	.value	671
	.value	671
	.value	672
	.value	672
	.value	672
	.value	672
	.value	666
	.value	666
	.value	680
	.value	666
	.value	667
	.value	667
	.value	681
	.value	667
	.value	669
	.value	669
	.value	682
	.value	669
	.value	666
	.value	671
	.value	671
	.value	683
	.value	671
	.value	672
	.value	672
	.value	684
	.value	672
	.value	685
	.value	666
	.value	680
	.value	666
	.value	686
	.value	667
	.value	681
	.value	680
	.value	667
	.value	687
	.value	669
	.value	682
	.value	680
	.value	669
	.value	666
	.value	688
	.value	671
	.value	683
	.value	671
	.value	689
	.value	672
	.value	684
	.value	680
	.value	672
	.value	685
	.value	685
	.value	666
	.value	686
	.value	685
	.value	686
	.value	667
	.value	687
	.value	685
	.value	687
	.value	669
	.value	666
	.value	688
	.value	688
	.value	671
	.value	689
	.value	685
	.value	569
	.value	672
	.value	685
	.value	685
	.value	666
	.value	686
	.value	686
	.value	667
	.value	687
	.value	687
	.value	669
	.value	666
	.value	688
	.value	688
	.value	671
	.value	569
	.value	569
	.value	672
	.value	685
	.value	685
	.value	686
	.value	686
	.value	687
	.value	687
	.value	666
	.value	688
	.value	688
	.value	569
	.value	569
	.value	685
	.value	685
	.value	686
	.value	686
	.value	687
	.value	687
	.value	688
	.value	688
	.value	569
	.value	569
	.value	685
	.value	685
	.value	686
	.value	686
	.value	687
	.value	687
	.value	688
	.value	688
	.value	569
	.value	569
	.value	685
	.value	685
	.value	686
	.value	686
	.value	687
	.value	687
	.value	688
	.value	688
	.value	569
	.value	569
	.value	690
	.value	685
	.value	691
	.value	686
	.value	692
	.value	687
	.value	693
	.value	688
	.value	694
	.value	569
	.value	690
	.value	685
	.value	691
	.value	690
	.value	686
	.value	692
	.value	690
	.value	687
	.value	693
	.value	688
	.value	694
	.value	690
	.value	569
	.value	695
	.value	696
	.value	697
	.value	698
	.value	699
	.value	695
	.value	696
	.value	695
	.value	697
	.value	695
	.value	698
	.value	699
	.value	695
	.value	0
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.align 32
	.type	yy_nxt, @object
	.size	yy_nxt, 2968
yy_nxt:
	.value	0
	.value	4
	.value	5
	.value	6
	.value	7
	.value	8
	.value	9
	.value	10
	.value	11
	.value	12
	.value	13
	.value	14
	.value	15
	.value	16
	.value	17
	.value	17
	.value	17
	.value	17
	.value	17
	.value	17
	.value	17
	.value	17
	.value	4
	.value	18
	.value	19
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	20
	.value	21
	.value	20
	.value	22
	.value	23
	.value	20
	.value	20
	.value	20
	.value	20
	.value	24
	.value	25
	.value	20
	.value	26
	.value	27
	.value	28
	.value	29
	.value	30
	.value	20
	.value	31
	.value	32
	.value	33
	.value	20
	.value	20
	.value	20
	.value	34
	.value	20
	.value	20
	.value	36
	.value	38
	.value	41
	.value	42
	.value	43
	.value	44
	.value	45
	.value	46
	.value	47
	.value	51
	.value	35
	.value	35
	.value	72
	.value	106
	.value	140
	.value	68
	.value	141
	.value	72
	.value	38
	.value	48
	.value	49
	.value	35
	.value	657
	.value	72
	.value	69
	.value	107
	.value	72
	.value	51
	.value	72
	.value	72
	.value	73
	.value	65
	.value	666
	.value	72
	.value	70
	.value	73
	.value	74
	.value	39
	.value	35
	.value	76
	.value	72
	.value	73
	.value	52
	.value	53
	.value	73
	.value	81
	.value	75
	.value	73
	.value	72
	.value	159
	.value	77
	.value	78
	.value	72
	.value	80
	.value	82
	.value	79
	.value	72
	.value	105
	.value	73
	.value	72
	.value	83
	.value	72
	.value	84
	.value	137
	.value	54
	.value	376
	.value	73
	.value	85
	.value	86
	.value	87
	.value	73
	.value	55
	.value	35
	.value	56
	.value	73
	.value	57
	.value	58
	.value	73
	.value	59
	.value	88
	.value	72
	.value	93
	.value	103
	.value	60
	.value	72
	.value	72
	.value	89
	.value	61
	.value	62
	.value	63
	.value	72
	.value	72
	.value	90
	.value	72
	.value	134
	.value	108
	.value	163
	.value	152
	.value	73
	.value	109
	.value	91
	.value	135
	.value	73
	.value	73
	.value	136
	.value	96
	.value	98
	.value	110
	.value	73
	.value	73
	.value	92
	.value	102
	.value	149
	.value	99
	.value	94
	.value	97
	.value	150
	.value	153
	.value	72
	.value	656
	.value	95
	.value	72
	.value	72
	.value	72
	.value	72
	.value	573
	.value	100
	.value	151
	.value	574
	.value	169
	.value	101
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	104
	.value	114
	.value	160
	.value	161
	.value	115
	.value	162
	.value	111
	.value	118
	.value	119
	.value	120
	.value	121
	.value	116
	.value	164
	.value	112
	.value	125
	.value	72
	.value	117
	.value	72
	.value	113
	.value	167
	.value	126
	.value	127
	.value	72
	.value	72
	.value	72
	.value	122
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	170
	.value	165
	.value	72
	.value	128
	.value	129
	.value	130
	.value	131
	.value	171
	.value	72
	.value	72
	.value	72
	.value	132
	.value	166
	.value	168
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	172
	.value	204
	.value	133
	.value	173
	.value	72
	.value	174
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	38
	.value	72
	.value	201
	.value	180
	.value	205
	.value	177
	.value	176
	.value	37
	.value	537
	.value	221
	.value	202
	.value	224
	.value	51
	.value	181
	.value	192
	.value	175
	.value	178
	.value	222
	.value	182
	.value	186
	.value	179
	.value	185
	.value	187
	.value	184
	.value	183
	.value	190
	.value	225
	.value	189
	.value	188
	.value	206
	.value	193
	.value	191
	.value	227
	.value	194
	.value	195
	.value	214
	.value	207
	.value	215
	.value	217
	.value	228
	.value	218
	.value	72
	.value	197
	.value	208
	.value	209
	.value	210
	.value	211
	.value	212
	.value	213
	.value	72
	.value	232
	.value	231
	.value	234
	.value	72
	.value	235
	.value	666
	.value	216
	.value	666
	.value	72
	.value	219
	.value	233
	.value	233
	.value	233
	.value	233
	.value	233
	.value	233
	.value	233
	.value	233
	.value	233
	.value	72
	.value	253
	.value	72
	.value	72
	.value	252
	.value	72
	.value	72
	.value	72
	.value	262
	.value	271
	.value	72
	.value	254
	.value	583
	.value	72
	.value	51
	.value	584
	.value	255
	.value	257
	.value	38
	.value	72
	.value	263
	.value	38
	.value	256
	.value	72
	.value	267
	.value	72
	.value	72
	.value	258
	.value	297
	.value	261
	.value	264
	.value	322
	.value	259
	.value	272
	.value	268
	.value	265
	.value	277
	.value	273
	.value	260
	.value	269
	.value	281
	.value	266
	.value	274
	.value	285
	.value	348
	.value	270
	.value	278
	.value	275
	.value	276
	.value	72
	.value	282
	.value	279
	.value	72
	.value	286
	.value	329
	.value	283
	.value	72
	.value	280
	.value	287
	.value	72
	.value	323
	.value	284
	.value	72
	.value	38
	.value	288
	.value	72
	.value	289
	.value	51
	.value	72
	.value	293
	.value	72
	.value	420
	.value	72
	.value	298
	.value	366
	.value	330
	.value	290
	.value	331
	.value	377
	.value	294
	.value	38
	.value	291
	.value	302
	.value	299
	.value	295
	.value	306
	.value	464
	.value	292
	.value	300
	.value	310
	.value	296
	.value	72
	.value	303
	.value	72
	.value	301
	.value	307
	.value	332
	.value	304
	.value	72
	.value	311
	.value	308
	.value	417
	.value	421
	.value	305
	.value	312
	.value	72
	.value	309
	.value	333
	.value	314
	.value	334
	.value	313
	.value	72
	.value	336
	.value	375
	.value	337
	.value	318
	.value	653
	.value	339
	.value	315
	.value	340
	.value	382
	.value	383
	.value	324
	.value	316
	.value	342
	.value	319
	.value	343
	.value	418
	.value	335
	.value	317
	.value	320
	.value	384
	.value	325
	.value	338
	.value	51
	.value	385
	.value	321
	.value	326
	.value	341
	.value	345
	.value	437
	.value	346
	.value	38
	.value	327
	.value	72
	.value	344
	.value	350
	.value	350
	.value	350
	.value	350
	.value	350
	.value	350
	.value	350
	.value	350
	.value	350
	.value	72
	.value	72
	.value	72
	.value	51
	.value	38
	.value	347
	.value	351
	.value	351
	.value	351
	.value	351
	.value	351
	.value	351
	.value	351
	.value	351
	.value	351
	.value	51
	.value	412
	.value	367
	.value	371
	.value	378
	.value	402
	.value	403
	.value	38
	.value	422
	.value	72
	.value	51
	.value	419
	.value	368
	.value	372
	.value	379
	.value	72
	.value	404
	.value	369
	.value	373
	.value	380
	.value	405
	.value	72
	.value	72
	.value	370
	.value	374
	.value	381
	.value	386
	.value	387
	.value	408
	.value	409
	.value	72
	.value	38
	.value	38
	.value	38
	.value	390
	.value	391
	.value	438
	.value	388
	.value	424
	.value	410
	.value	51
	.value	389
	.value	436
	.value	411
	.value	446
	.value	392
	.value	423
	.value	51
	.value	51
	.value	393
	.value	72
	.value	51
	.value	72
	.value	72
	.value	38
	.value	38
	.value	439
	.value	440
	.value	38
	.value	51
	.value	38
	.value	51
	.value	72
	.value	51
	.value	72
	.value	51
	.value	72
	.value	448
	.value	72
	.value	462
	.value	445
	.value	447
	.value	38
	.value	461
	.value	463
	.value	38
	.value	449
	.value	484
	.value	38
	.value	38
	.value	51
	.value	450
	.value	452
	.value	51
	.value	451
	.value	51
	.value	51
	.value	469
	.value	72
	.value	473
	.value	72
	.value	38
	.value	72
	.value	38
	.value	72
	.value	485
	.value	38
	.value	38
	.value	51
	.value	51
	.value	486
	.value	487
	.value	51
	.value	72
	.value	470
	.value	51
	.value	505
	.value	474
	.value	492
	.value	72
	.value	471
	.value	472
	.value	475
	.value	476
	.value	507
	.value	72
	.value	494
	.value	72
	.value	496
	.value	38
	.value	38
	.value	498
	.value	38
	.value	506
	.value	526
	.value	51
	.value	493
	.value	508
	.value	497
	.value	51
	.value	513
	.value	50
	.value	495
	.value	499
	.value	517
	.value	542
	.value	51
	.value	72
	.value	72
	.value	527
	.value	72
	.value	514
	.value	72
	.value	50
	.value	518
	.value	38
	.value	516
	.value	562
	.value	529
	.value	515
	.value	528
	.value	520
	.value	519
	.value	534
	.value	549
	.value	550
	.value	535
	.value	38
	.value	540
	.value	51
	.value	539
	.value	37
	.value	537
	.value	37
	.value	558
	.value	50
	.value	37
	.value	558
	.value	50
	.value	542
	.value	572
	.value	652
	.value	562
	.value	538
	.value	50
	.value	553
	.value	586
	.value	563
	.value	562
	.value	587
	.value	72
	.value	578
	.value	37
	.value	558
	.value	543
	.value	532
	.value	532
	.value	649
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	559
	.value	588
	.value	50
	.value	51
	.value	37
	.value	558
	.value	562
	.value	564
	.value	560
	.value	552
	.value	532
	.value	532
	.value	554
	.value	554
	.value	641
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	37
	.value	558
	.value	579
	.value	37
	.value	558
	.value	580
	.value	639
	.value	37
	.value	558
	.value	570
	.value	554
	.value	554
	.value	581
	.value	50
	.value	612
	.value	37
	.value	558
	.value	646
	.value	593
	.value	50
	.value	591
	.value	37
	.value	643
	.value	562
	.value	571
	.value	532
	.value	532
	.value	638
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	37
	.value	558
	.value	50
	.value	37
	.value	558
	.value	592
	.value	562
	.value	37
	.value	558
	.value	552
	.value	532
	.value	532
	.value	576
	.value	613
	.value	637
	.value	577
	.value	554
	.value	554
	.value	602
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	50
	.value	50
	.value	50
	.value	636
	.value	562
	.value	562
	.value	562
	.value	614
	.value	50
	.value	570
	.value	554
	.value	554
	.value	562
	.value	594
	.value	631
	.value	50
	.value	603
	.value	630
	.value	622
	.value	562
	.value	37
	.value	558
	.value	37
	.value	558
	.value	50
	.value	623
	.value	50
	.value	629
	.value	562
	.value	628
	.value	562
	.value	37
	.value	558
	.value	50
	.value	37
	.value	643
	.value	627
	.value	562
	.value	37
	.value	660
	.value	604
	.value	626
	.value	605
	.value	37
	.value	558
	.value	615
	.value	50
	.value	624
	.value	50
	.value	50
	.value	646
	.value	621
	.value	562
	.value	662
	.value	37
	.value	660
	.value	50
	.value	620
	.value	619
	.value	618
	.value	662
	.value	617
	.value	616
	.value	611
	.value	610
	.value	609
	.value	608
	.value	607
	.value	625
	.value	606
	.value	644
	.value	601
	.value	647
	.value	600
	.value	632
	.value	72
	.value	633
	.value	599
	.value	634
	.value	598
	.value	635
	.value	640
	.value	640
	.value	597
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	596
	.value	595
	.value	654
	.value	51
	.value	38
	.value	590
	.value	589
	.value	655
	.value	585
	.value	651
	.value	640
	.value	640
	.value	640
	.value	640
	.value	582
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	575
	.value	72
	.value	568
	.value	567
	.value	565
	.value	51
	.value	38
	.value	556
	.value	555
	.value	651
	.value	640
	.value	640
	.value	658
	.value	658
	.value	548
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	546
	.value	545
	.value	544
	.value	533
	.value	531
	.value	530
	.value	525
	.value	524
	.value	523
	.value	665
	.value	658
	.value	658
	.value	658
	.value	658
	.value	522
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	521
	.value	512
	.value	511
	.value	510
	.value	509
	.value	504
	.value	503
	.value	502
	.value	501
	.value	665
	.value	658
	.value	658
	.value	37
	.value	37
	.value	37
	.value	37
	.value	37
	.value	37
	.value	37
	.value	37
	.value	37
	.value	40
	.value	500
	.value	491
	.value	490
	.value	489
	.value	40
	.value	50
	.value	50
	.value	50
	.value	50
	.value	50
	.value	50
	.value	50
	.value	50
	.value	50
	.value	64
	.value	488
	.value	483
	.value	482
	.value	481
	.value	64
	.value	64
	.value	66
	.value	480
	.value	66
	.value	66
	.value	66
	.value	66
	.value	66
	.value	66
	.value	66
	.value	71
	.value	71
	.value	71
	.value	71
	.value	71
	.value	71
	.value	71
	.value	138
	.value	138
	.value	138
	.value	138
	.value	138
	.value	139
	.value	479
	.value	478
	.value	139
	.value	154
	.value	477
	.value	154
	.value	154
	.value	468
	.value	154
	.value	233
	.value	233
	.value	350
	.value	350
	.value	351
	.value	351
	.value	425
	.value	467
	.value	425
	.value	425
	.value	425
	.value	425
	.value	425
	.value	425
	.value	425
	.value	532
	.value	466
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	532
	.value	536
	.value	536
	.value	536
	.value	536
	.value	536
	.value	536
	.value	536
	.value	536
	.value	536
	.value	541
	.value	541
	.value	541
	.value	541
	.value	541
	.value	541
	.value	541
	.value	541
	.value	541
	.value	547
	.value	465
	.value	547
	.value	547
	.value	547
	.value	547
	.value	547
	.value	547
	.value	547
	.value	551
	.value	72
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	554
	.value	460
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	554
	.value	557
	.value	557
	.value	557
	.value	557
	.value	557
	.value	557
	.value	557
	.value	557
	.value	557
	.value	561
	.value	561
	.value	561
	.value	561
	.value	561
	.value	561
	.value	561
	.value	561
	.value	561
	.value	566
	.value	459
	.value	566
	.value	566
	.value	566
	.value	566
	.value	566
	.value	566
	.value	566
	.value	569
	.value	458
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	640
	.value	457
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	640
	.value	642
	.value	642
	.value	642
	.value	642
	.value	642
	.value	642
	.value	642
	.value	642
	.value	642
	.value	645
	.value	645
	.value	645
	.value	645
	.value	645
	.value	645
	.value	645
	.value	645
	.value	645
	.value	648
	.value	456
	.value	648
	.value	648
	.value	648
	.value	648
	.value	648
	.value	648
	.value	648
	.value	650
	.value	455
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	658
	.value	454
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	658
	.value	659
	.value	659
	.value	659
	.value	659
	.value	659
	.value	659
	.value	659
	.value	659
	.value	659
	.value	661
	.value	661
	.value	661
	.value	661
	.value	661
	.value	661
	.value	661
	.value	661
	.value	661
	.value	663
	.value	453
	.value	663
	.value	663
	.value	663
	.value	663
	.value	663
	.value	663
	.value	663
	.value	664
	.value	444
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	443
	.value	442
	.value	441
	.value	435
	.value	434
	.value	433
	.value	432
	.value	431
	.value	430
	.value	429
	.value	428
	.value	427
	.value	426
	.value	416
	.value	415
	.value	414
	.value	413
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	407
	.value	406
	.value	401
	.value	400
	.value	399
	.value	398
	.value	397
	.value	396
	.value	395
	.value	394
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	365
	.value	364
	.value	363
	.value	362
	.value	361
	.value	360
	.value	359
	.value	358
	.value	357
	.value	356
	.value	355
	.value	354
	.value	353
	.value	352
	.value	349
	.value	328
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	72
	.value	251
	.value	250
	.value	249
	.value	248
	.value	247
	.value	246
	.value	245
	.value	244
	.value	243
	.value	242
	.value	241
	.value	240
	.value	239
	.value	238
	.value	237
	.value	236
	.value	230
	.value	229
	.value	226
	.value	223
	.value	220
	.value	203
	.value	200
	.value	199
	.value	198
	.value	196
	.value	72
	.value	72
	.value	158
	.value	157
	.value	156
	.value	155
	.value	148
	.value	147
	.value	146
	.value	145
	.value	144
	.value	143
	.value	142
	.value	51
	.value	124
	.value	123
	.value	38
	.value	36
	.value	104
	.value	67
	.value	35
	.value	35
	.value	35
	.value	35
	.value	35
	.value	35
	.value	666
	.value	3
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.align 32
	.type	yy_chk, @object
	.size	yy_chk, 2968
yy_chk:
	.value	0
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	1
	.value	5
	.value	7
	.value	9
	.value	9
	.value	9
	.value	9
	.value	9
	.value	9
	.value	9
	.value	10
	.value	16
	.value	17
	.value	20
	.value	41
	.value	54
	.value	19
	.value	54
	.value	21
	.value	39
	.value	9
	.value	9
	.value	19
	.value	652
	.value	22
	.value	19
	.value	41
	.value	24
	.value	52
	.value	73
	.value	23
	.value	20
	.value	16
	.value	17
	.value	297
	.value	19
	.value	21
	.value	21
	.value	7
	.value	5
	.value	22
	.value	25
	.value	22
	.value	10
	.value	15
	.value	24
	.value	24
	.value	21
	.value	23
	.value	29
	.value	73
	.value	22
	.value	22
	.value	34
	.value	23
	.value	24
	.value	22
	.value	27
	.value	39
	.value	25
	.value	26
	.value	25
	.value	77
	.value	25
	.value	52
	.value	15
	.value	297
	.value	29
	.value	25
	.value	25
	.value	25
	.value	34
	.value	15
	.value	15
	.value	15
	.value	27
	.value	15
	.value	15
	.value	26
	.value	15
	.value	26
	.value	28
	.value	29
	.value	34
	.value	15
	.value	30
	.value	31
	.value	27
	.value	15
	.value	15
	.value	15
	.value	32
	.value	33
	.value	27
	.value	82
	.value	49
	.value	42
	.value	77
	.value	63
	.value	28
	.value	42
	.value	28
	.value	49
	.value	30
	.value	31
	.value	49
	.value	31
	.value	32
	.value	42
	.value	32
	.value	33
	.value	28
	.value	33
	.value	62
	.value	32
	.value	30
	.value	31
	.value	62
	.value	63
	.value	76
	.value	649
	.value	30
	.value	78
	.value	80
	.value	74
	.value	75
	.value	555
	.value	32
	.value	62
	.value	555
	.value	82
	.value	32
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	40
	.value	43
	.value	44
	.value	74
	.value	75
	.value	44
	.value	76
	.value	43
	.value	45
	.value	45
	.value	45
	.value	45
	.value	44
	.value	78
	.value	43
	.value	48
	.value	84
	.value	44
	.value	79
	.value	43
	.value	80
	.value	48
	.value	48
	.value	85
	.value	86
	.value	81
	.value	45
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	64
	.value	84
	.value	79
	.value	87
	.value	48
	.value	48
	.value	48
	.value	48
	.value	85
	.value	88
	.value	89
	.value	90
	.value	48
	.value	79
	.value	81
	.value	91
	.value	96
	.value	92
	.value	93
	.value	95
	.value	86
	.value	121
	.value	48
	.value	87
	.value	94
	.value	88
	.value	98
	.value	97
	.value	101
	.value	100
	.value	99
	.value	102
	.value	105
	.value	103
	.value	119
	.value	93
	.value	121
	.value	91
	.value	90
	.value	515
	.value	515
	.value	129
	.value	119
	.value	131
	.value	137
	.value	93
	.value	100
	.value	89
	.value	92
	.value	129
	.value	93
	.value	96
	.value	92
	.value	95
	.value	97
	.value	94
	.value	93
	.value	99
	.value	131
	.value	98
	.value	97
	.value	122
	.value	101
	.value	99
	.value	133
	.value	102
	.value	103
	.value	126
	.value	122
	.value	126
	.value	127
	.value	133
	.value	127
	.value	168
	.value	105
	.value	125
	.value	125
	.value	125
	.value	125
	.value	125
	.value	125
	.value	159
	.value	139
	.value	137
	.value	141
	.value	160
	.value	141
	.value	139
	.value	126
	.value	139
	.value	163
	.value	127
	.value	140
	.value	140
	.value	140
	.value	140
	.value	140
	.value	140
	.value	140
	.value	140
	.value	140
	.value	161
	.value	160
	.value	162
	.value	164
	.value	159
	.value	185
	.value	169
	.value	167
	.value	163
	.value	168
	.value	174
	.value	160
	.value	567
	.value	193
	.value	231
	.value	567
	.value	160
	.value	161
	.value	389
	.value	175
	.value	164
	.value	197
	.value	160
	.value	176
	.value	167
	.value	194
	.value	177
	.value	161
	.value	185
	.value	162
	.value	164
	.value	193
	.value	161
	.value	169
	.value	167
	.value	164
	.value	175
	.value	174
	.value	161
	.value	167
	.value	176
	.value	164
	.value	174
	.value	177
	.value	231
	.value	167
	.value	175
	.value	174
	.value	174
	.value	179
	.value	176
	.value	175
	.value	184
	.value	177
	.value	197
	.value	176
	.value	187
	.value	175
	.value	177
	.value	252
	.value	194
	.value	176
	.value	322
	.value	386
	.value	177
	.value	188
	.value	179
	.value	390
	.value	189
	.value	184
	.value	439
	.value	389
	.value	190
	.value	187
	.value	252
	.value	208
	.value	179
	.value	208
	.value	322
	.value	184
	.value	387
	.value	179
	.value	188
	.value	187
	.value	184
	.value	189
	.value	439
	.value	179
	.value	187
	.value	190
	.value	184
	.value	191
	.value	188
	.value	275
	.value	187
	.value	189
	.value	208
	.value	188
	.value	192
	.value	190
	.value	189
	.value	386
	.value	390
	.value	188
	.value	190
	.value	195
	.value	189
	.value	209
	.value	191
	.value	209
	.value	190
	.value	409
	.value	210
	.value	275
	.value	210
	.value	192
	.value	641
	.value	211
	.value	191
	.value	211
	.value	328
	.value	328
	.value	195
	.value	191
	.value	212
	.value	192
	.value	212
	.value	387
	.value	209
	.value	191
	.value	192
	.value	328
	.value	195
	.value	210
	.value	391
	.value	328
	.value	192
	.value	195
	.value	211
	.value	213
	.value	409
	.value	213
	.value	388
	.value	195
	.value	377
	.value	212
	.value	234
	.value	234
	.value	234
	.value	234
	.value	234
	.value	234
	.value	234
	.value	234
	.value	234
	.value	271
	.value	272
	.value	323
	.value	393
	.value	329
	.value	213
	.value	235
	.value	235
	.value	235
	.value	235
	.value	235
	.value	235
	.value	235
	.value	235
	.value	235
	.value	348
	.value	377
	.value	271
	.value	272
	.value	323
	.value	363
	.value	363
	.value	418
	.value	391
	.value	366
	.value	392
	.value	388
	.value	271
	.value	272
	.value	323
	.value	410
	.value	363
	.value	271
	.value	272
	.value	323
	.value	363
	.value	411
	.value	408
	.value	271
	.value	272
	.value	323
	.value	329
	.value	329
	.value	366
	.value	366
	.value	412
	.value	417
	.value	419
	.value	420
	.value	348
	.value	348
	.value	410
	.value	329
	.value	393
	.value	366
	.value	421
	.value	329
	.value	408
	.value	366
	.value	418
	.value	348
	.value	392
	.value	422
	.value	423
	.value	348
	.value	437
	.value	424
	.value	436
	.value	438
	.value	445
	.value	446
	.value	411
	.value	412
	.value	447
	.value	449
	.value	448
	.value	450
	.value	461
	.value	451
	.value	462
	.value	452
	.value	463
	.value	420
	.value	464
	.value	437
	.value	417
	.value	419
	.value	469
	.value	436
	.value	438
	.value	470
	.value	421
	.value	461
	.value	471
	.value	472
	.value	474
	.value	422
	.value	424
	.value	476
	.value	423
	.value	473
	.value	475
	.value	445
	.value	484
	.value	449
	.value	485
	.value	492
	.value	487
	.value	493
	.value	486
	.value	462
	.value	494
	.value	495
	.value	496
	.value	497
	.value	463
	.value	464
	.value	498
	.value	505
	.value	446
	.value	499
	.value	484
	.value	450
	.value	469
	.value	506
	.value	447
	.value	448
	.value	451
	.value	452
	.value	486
	.value	507
	.value	471
	.value	508
	.value	473
	.value	513
	.value	514
	.value	475
	.value	516
	.value	485
	.value	505
	.value	518
	.value	470
	.value	487
	.value	474
	.value	517
	.value	492
	.value	519
	.value	472
	.value	476
	.value	496
	.value	519
	.value	520
	.value	527
	.value	526
	.value	506
	.value	553
	.value	493
	.value	529
	.value	539
	.value	497
	.value	560
	.value	495
	.value	539
	.value	508
	.value	494
	.value	507
	.value	499
	.value	498
	.value	513
	.value	526
	.value	527
	.value	514
	.value	538
	.value	518
	.value	543
	.value	517
	.value	536
	.value	536
	.value	534
	.value	534
	.value	541
	.value	557
	.value	557
	.value	561
	.value	541
	.value	553
	.value	639
	.value	561
	.value	516
	.value	563
	.value	529
	.value	571
	.value	539
	.value	563
	.value	571
	.value	572
	.value	560
	.value	602
	.value	602
	.value	520
	.value	528
	.value	528
	.value	637
	.value	528
	.value	528
	.value	528
	.value	528
	.value	528
	.value	528
	.value	528
	.value	528
	.value	528
	.value	534
	.value	572
	.value	579
	.value	564
	.value	576
	.value	576
	.value	579
	.value	543
	.value	538
	.value	528
	.value	528
	.value	528
	.value	549
	.value	549
	.value	631
	.value	549
	.value	549
	.value	549
	.value	549
	.value	549
	.value	549
	.value	549
	.value	549
	.value	549
	.value	559
	.value	559
	.value	563
	.value	577
	.value	577
	.value	563
	.value	629
	.value	603
	.value	603
	.value	549
	.value	549
	.value	549
	.value	564
	.value	634
	.value	602
	.value	591
	.value	591
	.value	634
	.value	579
	.value	604
	.value	576
	.value	632
	.value	632
	.value	604
	.value	549
	.value	551
	.value	551
	.value	628
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	551
	.value	613
	.value	613
	.value	580
	.value	592
	.value	592
	.value	577
	.value	580
	.value	612
	.value	612
	.value	551
	.value	551
	.value	551
	.value	559
	.value	603
	.value	627
	.value	559
	.value	569
	.value	569
	.value	591
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	569
	.value	593
	.value	594
	.value	605
	.value	626
	.value	593
	.value	594
	.value	605
	.value	604
	.value	614
	.value	569
	.value	569
	.value	569
	.value	614
	.value	580
	.value	621
	.value	615
	.value	592
	.value	620
	.value	612
	.value	615
	.value	622
	.value	622
	.value	623
	.value	623
	.value	624
	.value	613
	.value	625
	.value	619
	.value	624
	.value	618
	.value	625
	.value	633
	.value	633
	.value	635
	.value	642
	.value	642
	.value	617
	.value	635
	.value	654
	.value	654
	.value	593
	.value	616
	.value	594
	.value	644
	.value	644
	.value	605
	.value	645
	.value	614
	.value	647
	.value	655
	.value	645
	.value	611
	.value	647
	.value	655
	.value	659
	.value	659
	.value	661
	.value	610
	.value	609
	.value	608
	.value	661
	.value	607
	.value	606
	.value	601
	.value	600
	.value	599
	.value	598
	.value	597
	.value	615
	.value	596
	.value	633
	.value	590
	.value	635
	.value	589
	.value	622
	.value	588
	.value	623
	.value	587
	.value	624
	.value	586
	.value	625
	.value	638
	.value	638
	.value	584
	.value	638
	.value	638
	.value	638
	.value	638
	.value	638
	.value	638
	.value	638
	.value	638
	.value	638
	.value	583
	.value	582
	.value	644
	.value	581
	.value	578
	.value	574
	.value	573
	.value	647
	.value	568
	.value	638
	.value	638
	.value	638
	.value	650
	.value	650
	.value	565
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	650
	.value	556
	.value	550
	.value	548
	.value	545
	.value	544
	.value	540
	.value	535
	.value	533
	.value	530
	.value	650
	.value	650
	.value	650
	.value	657
	.value	657
	.value	525
	.value	657
	.value	657
	.value	657
	.value	657
	.value	657
	.value	657
	.value	657
	.value	657
	.value	657
	.value	523
	.value	522
	.value	521
	.value	512
	.value	510
	.value	509
	.value	504
	.value	503
	.value	502
	.value	657
	.value	657
	.value	657
	.value	664
	.value	664
	.value	501
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	664
	.value	500
	.value	491
	.value	490
	.value	489
	.value	488
	.value	481
	.value	480
	.value	479
	.value	478
	.value	664
	.value	664
	.value	664
	.value	667
	.value	667
	.value	667
	.value	667
	.value	667
	.value	667
	.value	667
	.value	667
	.value	667
	.value	668
	.value	477
	.value	468
	.value	467
	.value	466
	.value	668
	.value	669
	.value	669
	.value	669
	.value	669
	.value	669
	.value	669
	.value	669
	.value	669
	.value	669
	.value	670
	.value	465
	.value	460
	.value	459
	.value	458
	.value	670
	.value	670
	.value	671
	.value	457
	.value	671
	.value	671
	.value	671
	.value	671
	.value	671
	.value	671
	.value	671
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	672
	.value	673
	.value	673
	.value	673
	.value	673
	.value	673
	.value	674
	.value	456
	.value	455
	.value	674
	.value	675
	.value	453
	.value	675
	.value	675
	.value	444
	.value	675
	.value	676
	.value	676
	.value	677
	.value	677
	.value	678
	.value	678
	.value	679
	.value	443
	.value	679
	.value	679
	.value	679
	.value	679
	.value	679
	.value	679
	.value	679
	.value	680
	.value	442
	.value	680
	.value	680
	.value	680
	.value	680
	.value	680
	.value	680
	.value	680
	.value	681
	.value	681
	.value	681
	.value	681
	.value	681
	.value	681
	.value	681
	.value	681
	.value	681
	.value	682
	.value	682
	.value	682
	.value	682
	.value	682
	.value	682
	.value	682
	.value	682
	.value	682
	.value	683
	.value	441
	.value	683
	.value	683
	.value	683
	.value	683
	.value	683
	.value	683
	.value	683
	.value	684
	.value	440
	.value	684
	.value	684
	.value	684
	.value	684
	.value	684
	.value	684
	.value	684
	.value	685
	.value	435
	.value	685
	.value	685
	.value	685
	.value	685
	.value	685
	.value	685
	.value	685
	.value	686
	.value	686
	.value	686
	.value	686
	.value	686
	.value	686
	.value	686
	.value	686
	.value	686
	.value	687
	.value	687
	.value	687
	.value	687
	.value	687
	.value	687
	.value	687
	.value	687
	.value	687
	.value	688
	.value	434
	.value	688
	.value	688
	.value	688
	.value	688
	.value	688
	.value	688
	.value	688
	.value	689
	.value	433
	.value	689
	.value	689
	.value	689
	.value	689
	.value	689
	.value	689
	.value	689
	.value	690
	.value	432
	.value	690
	.value	690
	.value	690
	.value	690
	.value	690
	.value	690
	.value	690
	.value	691
	.value	691
	.value	691
	.value	691
	.value	691
	.value	691
	.value	691
	.value	691
	.value	691
	.value	692
	.value	692
	.value	692
	.value	692
	.value	692
	.value	692
	.value	692
	.value	692
	.value	692
	.value	693
	.value	431
	.value	693
	.value	693
	.value	693
	.value	693
	.value	693
	.value	693
	.value	693
	.value	694
	.value	430
	.value	694
	.value	694
	.value	694
	.value	694
	.value	694
	.value	694
	.value	694
	.value	695
	.value	428
	.value	695
	.value	695
	.value	695
	.value	695
	.value	695
	.value	695
	.value	695
	.value	696
	.value	696
	.value	696
	.value	696
	.value	696
	.value	696
	.value	696
	.value	696
	.value	696
	.value	697
	.value	697
	.value	697
	.value	697
	.value	697
	.value	697
	.value	697
	.value	697
	.value	697
	.value	698
	.value	426
	.value	698
	.value	698
	.value	698
	.value	698
	.value	698
	.value	698
	.value	698
	.value	699
	.value	416
	.value	699
	.value	699
	.value	699
	.value	699
	.value	699
	.value	699
	.value	699
	.value	415
	.value	414
	.value	413
	.value	407
	.value	406
	.value	405
	.value	404
	.value	403
	.value	402
	.value	401
	.value	400
	.value	399
	.value	398
	.value	385
	.value	384
	.value	383
	.value	382
	.value	381
	.value	380
	.value	379
	.value	378
	.value	376
	.value	375
	.value	374
	.value	373
	.value	372
	.value	371
	.value	370
	.value	369
	.value	368
	.value	367
	.value	365
	.value	364
	.value	360
	.value	358
	.value	357
	.value	356
	.value	355
	.value	354
	.value	351
	.value	350
	.value	327
	.value	326
	.value	325
	.value	324
	.value	321
	.value	320
	.value	319
	.value	318
	.value	317
	.value	316
	.value	315
	.value	314
	.value	313
	.value	312
	.value	311
	.value	310
	.value	309
	.value	308
	.value	307
	.value	306
	.value	305
	.value	304
	.value	303
	.value	302
	.value	301
	.value	300
	.value	299
	.value	298
	.value	296
	.value	295
	.value	294
	.value	293
	.value	292
	.value	291
	.value	290
	.value	289
	.value	288
	.value	287
	.value	286
	.value	285
	.value	284
	.value	283
	.value	282
	.value	281
	.value	280
	.value	279
	.value	278
	.value	277
	.value	276
	.value	274
	.value	273
	.value	270
	.value	269
	.value	268
	.value	267
	.value	266
	.value	265
	.value	264
	.value	263
	.value	262
	.value	261
	.value	260
	.value	259
	.value	258
	.value	257
	.value	256
	.value	255
	.value	254
	.value	253
	.value	251
	.value	250
	.value	248
	.value	247
	.value	246
	.value	245
	.value	244
	.value	243
	.value	242
	.value	241
	.value	240
	.value	239
	.value	238
	.value	237
	.value	233
	.value	196
	.value	186
	.value	183
	.value	182
	.value	181
	.value	180
	.value	178
	.value	173
	.value	172
	.value	171
	.value	170
	.value	166
	.value	165
	.value	158
	.value	157
	.value	156
	.value	155
	.value	153
	.value	152
	.value	151
	.value	150
	.value	149
	.value	148
	.value	147
	.value	146
	.value	145
	.value	144
	.value	143
	.value	142
	.value	135
	.value	134
	.value	132
	.value	130
	.value	128
	.value	120
	.value	118
	.value	114
	.value	109
	.value	104
	.value	83
	.value	71
	.value	70
	.value	69
	.value	68
	.value	67
	.value	61
	.value	60
	.value	59
	.value	58
	.value	57
	.value	56
	.value	55
	.value	50
	.value	47
	.value	46
	.value	37
	.value	36
	.value	35
	.value	18
	.value	14
	.value	13
	.value	12
	.value	11
	.value	8
	.value	4
	.value	3
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.value	666
	.local	yy_last_accepting_state
	.comm	yy_last_accepting_state,4,4
	.local	yy_last_accepting_cpos
	.comm	yy_last_accepting_cpos,8,8
	.globl	yy_flex_debug
	.bss
	.align 4
	.type	yy_flex_debug, @object
	.size	yy_flex_debug, 4
yy_flex_debug:
	.zero	4
	.globl	yytext
	.align 8
	.type	yytext, @object
	.size	yytext, 8
yytext:
	.zero	8
	.globl	line_num
	.align 4
	.type	line_num, @object
	.size	line_num, 4
line_num:
	.zero	4
	.section	.rodata
	.align 8
.LC0:
	.string	"fatal flex scanner internal error--no action found"
	.text
	.globl	yylex
	.type	yylex, @function
yylex:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	yy_init(%rip), %eax
	testl	%eax, %eax
	jne	.L244
	movl	$1, yy_init(%rip)
	movl	yy_start(%rip), %eax
	testl	%eax, %eax
	jne	.L3
	movl	$1, yy_start(%rip)
.L3:
	movq	yyin(%rip), %rax
	testq	%rax, %rax
	jne	.L4
	movq	stdin(%rip), %rax
	movq	%rax, yyin(%rip)
.L4:
	movq	yyout(%rip), %rax
	testq	%rax, %rax
	jne	.L5
	movq	stdout(%rip), %rax
	movq	%rax, yyout(%rip)
.L5:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L6
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L7
.L6:
	call	yyensure_buffer_stack
	movq	yyin(%rip), %rax
	movq	yy_buffer_stack(%rip), %rdx
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movl	$16384, %esi
	movq	%rax, %rdi
	call	yy_create_buffer
	movq	%rax, (%rbx)
.L7:
	call	yy_load_buffer_state
.L244:
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -32(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	yy_start(%rip), %eax
	movl	%eax, -48(%rbp)
.L8:
.L12:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cltq
	leaq	yy_ec(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -49(%rbp)
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L10
	movl	-48(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-32(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L10
.L11:
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -48(%rbp)
	cmpl	$666, -48(%rbp)
	jle	.L10
	movzbl	-49(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -49(%rbp)
.L10:
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-49(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, -48(%rbp)
	jne	.L11
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-49(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -48(%rbp)
	addq	$1, -32(%rbp)
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cmpw	$1420, %ax
	jne	.L12
	nop
.L13:
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jne	.L14
	movq	yy_last_accepting_cpos(%rip), %rax
	movq	%rax, -32(%rbp)
	movl	yy_last_accepting_state(%rip), %eax
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -44(%rbp)
.L14:
	movq	-24(%rbp), %rax
	movq	%rax, yytext(%rip)
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	movl	%eax, yyleng(%rip)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, yy_c_buf_p(%rip)
.L15:
	cmpl	$217, -44(%rbp)
	ja	.L16
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L18(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L18(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L235-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L226-.L18
	.long	.L225-.L18
	.long	.L224-.L18
	.long	.L223-.L18
	.long	.L222-.L18
	.long	.L221-.L18
	.long	.L220-.L18
	.long	.L219-.L18
	.long	.L218-.L18
	.long	.L217-.L18
	.long	.L216-.L18
	.long	.L215-.L18
	.long	.L214-.L18
	.long	.L213-.L18
	.long	.L212-.L18
	.long	.L211-.L18
	.long	.L210-.L18
	.long	.L209-.L18
	.long	.L208-.L18
	.long	.L207-.L18
	.long	.L206-.L18
	.long	.L205-.L18
	.long	.L204-.L18
	.long	.L203-.L18
	.long	.L202-.L18
	.long	.L201-.L18
	.long	.L200-.L18
	.long	.L199-.L18
	.long	.L198-.L18
	.long	.L197-.L18
	.long	.L196-.L18
	.long	.L195-.L18
	.long	.L194-.L18
	.long	.L193-.L18
	.long	.L192-.L18
	.long	.L191-.L18
	.long	.L190-.L18
	.long	.L189-.L18
	.long	.L188-.L18
	.long	.L187-.L18
	.long	.L186-.L18
	.long	.L185-.L18
	.long	.L184-.L18
	.long	.L183-.L18
	.long	.L182-.L18
	.long	.L181-.L18
	.long	.L180-.L18
	.long	.L179-.L18
	.long	.L178-.L18
	.long	.L177-.L18
	.long	.L176-.L18
	.long	.L175-.L18
	.long	.L174-.L18
	.long	.L173-.L18
	.long	.L172-.L18
	.long	.L171-.L18
	.long	.L170-.L18
	.long	.L169-.L18
	.long	.L168-.L18
	.long	.L167-.L18
	.long	.L166-.L18
	.long	.L165-.L18
	.long	.L164-.L18
	.long	.L163-.L18
	.long	.L162-.L18
	.long	.L161-.L18
	.long	.L160-.L18
	.long	.L159-.L18
	.long	.L158-.L18
	.long	.L157-.L18
	.long	.L156-.L18
	.long	.L155-.L18
	.long	.L154-.L18
	.long	.L153-.L18
	.long	.L152-.L18
	.long	.L151-.L18
	.long	.L150-.L18
	.long	.L149-.L18
	.long	.L148-.L18
	.long	.L147-.L18
	.long	.L146-.L18
	.long	.L145-.L18
	.long	.L144-.L18
	.long	.L143-.L18
	.long	.L142-.L18
	.long	.L141-.L18
	.long	.L140-.L18
	.long	.L139-.L18
	.long	.L138-.L18
	.long	.L137-.L18
	.long	.L136-.L18
	.long	.L135-.L18
	.long	.L134-.L18
	.long	.L133-.L18
	.long	.L132-.L18
	.long	.L131-.L18
	.long	.L130-.L18
	.long	.L129-.L18
	.long	.L128-.L18
	.long	.L127-.L18
	.long	.L126-.L18
	.long	.L125-.L18
	.long	.L124-.L18
	.long	.L123-.L18
	.long	.L122-.L18
	.long	.L121-.L18
	.long	.L120-.L18
	.long	.L119-.L18
	.long	.L118-.L18
	.long	.L117-.L18
	.long	.L116-.L18
	.long	.L115-.L18
	.long	.L114-.L18
	.long	.L113-.L18
	.long	.L112-.L18
	.long	.L111-.L18
	.long	.L110-.L18
	.long	.L109-.L18
	.long	.L108-.L18
	.long	.L107-.L18
	.long	.L106-.L18
	.long	.L105-.L18
	.long	.L104-.L18
	.long	.L103-.L18
	.long	.L102-.L18
	.long	.L101-.L18
	.long	.L100-.L18
	.long	.L99-.L18
	.long	.L98-.L18
	.long	.L97-.L18
	.long	.L96-.L18
	.long	.L95-.L18
	.long	.L94-.L18
	.long	.L93-.L18
	.long	.L92-.L18
	.long	.L91-.L18
	.long	.L90-.L18
	.long	.L89-.L18
	.long	.L88-.L18
	.long	.L87-.L18
	.long	.L86-.L18
	.long	.L85-.L18
	.long	.L84-.L18
	.long	.L83-.L18
	.long	.L82-.L18
	.long	.L81-.L18
	.long	.L80-.L18
	.long	.L79-.L18
	.long	.L78-.L18
	.long	.L77-.L18
	.long	.L76-.L18
	.long	.L75-.L18
	.long	.L74-.L18
	.long	.L73-.L18
	.long	.L72-.L18
	.long	.L71-.L18
	.long	.L70-.L18
	.long	.L69-.L18
	.long	.L68-.L18
	.long	.L67-.L18
	.long	.L66-.L18
	.long	.L65-.L18
	.long	.L64-.L18
	.long	.L63-.L18
	.long	.L62-.L18
	.long	.L61-.L18
	.long	.L60-.L18
	.long	.L59-.L18
	.long	.L58-.L18
	.long	.L57-.L18
	.long	.L56-.L18
	.long	.L55-.L18
	.long	.L54-.L18
	.long	.L53-.L18
	.long	.L52-.L18
	.long	.L51-.L18
	.long	.L50-.L18
	.long	.L49-.L18
	.long	.L48-.L18
	.long	.L47-.L18
	.long	.L46-.L18
	.long	.L45-.L18
	.long	.L44-.L18
	.long	.L43-.L18
	.long	.L42-.L18
	.long	.L41-.L18
	.long	.L40-.L18
	.long	.L39-.L18
	.long	.L38-.L18
	.long	.L37-.L18
	.long	.L36-.L18
	.long	.L35-.L18
	.long	.L245-.L18
	.long	.L245-.L18
	.long	.L32-.L18
	.long	.L31-.L18
	.long	.L30-.L18
	.long	.L29-.L18
	.long	.L28-.L18
	.long	.L27-.L18
	.long	.L26-.L18
	.long	.L25-.L18
	.long	.L24-.L18
	.long	.L23-.L18
	.long	.L245-.L18
	.long	.L21-.L18
	.long	.L20-.L18
	.long	.L19-.L18
	.long	.L17-.L18
	.text
.L235:
	movzbl	yy_hold_char(%rip), %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_last_accepting_cpos(%rip), %rax
	movq	%rax, -32(%rbp)
	movl	yy_last_accepting_state(%rip), %eax
	movl	%eax, -48(%rbp)
	jmp	.L13
.L226:
	movl	line_num(%rip), %eax
	addl	$1, %eax
	movl	%eax, line_num(%rip)
	movl	$999, %eax
	jmp	.L237
.L225:
	movl	$600, %eax
	jmp	.L237
.L224:
	movl	$601, %eax
	jmp	.L237
.L223:
	movl	$602, %eax
	jmp	.L237
.L222:
	movl	$603, %eax
	jmp	.L237
.L221:
	movl	$604, %eax
	jmp	.L237
.L220:
	movl	$605, %eax
	jmp	.L237
.L219:
	movl	$606, %eax
	jmp	.L237
.L218:
	movl	$607, %eax
	jmp	.L237
.L217:
	movl	$608, %eax
	jmp	.L237
.L216:
	movl	$609, %eax
	jmp	.L237
.L215:
	movl	$610, %eax
	jmp	.L237
.L214:
	movl	$611, %eax
	jmp	.L237
.L213:
	movl	$612, %eax
	jmp	.L237
.L212:
	movl	$613, %eax
	jmp	.L237
.L211:
	movl	$614, %eax
	jmp	.L237
.L210:
	movl	$615, %eax
	jmp	.L237
.L209:
	movl	$620, %eax
	jmp	.L237
.L208:
	movl	$621, %eax
	jmp	.L237
.L207:
	movl	$622, %eax
	jmp	.L237
.L206:
	movl	$623, %eax
	jmp	.L237
.L205:
	movl	$624, %eax
	jmp	.L237
.L204:
	movl	$625, %eax
	jmp	.L237
.L203:
	movl	$626, %eax
	jmp	.L237
.L202:
	movl	$627, %eax
	jmp	.L237
.L201:
	movl	$628, %eax
	jmp	.L237
.L200:
	movl	$629, %eax
	jmp	.L237
.L199:
	movl	$630, %eax
	jmp	.L237
.L198:
	movl	$631, %eax
	jmp	.L237
.L197:
	movl	$632, %eax
	jmp	.L237
.L196:
	movl	$633, %eax
	jmp	.L237
.L195:
	movl	$634, %eax
	jmp	.L237
.L194:
	movl	$635, %eax
	jmp	.L237
.L193:
	movl	$640, %eax
	jmp	.L237
.L192:
	movl	$641, %eax
	jmp	.L237
.L191:
	movl	$642, %eax
	jmp	.L237
.L190:
	movl	$643, %eax
	jmp	.L237
.L189:
	movl	$644, %eax
	jmp	.L237
.L188:
	movl	$645, %eax
	jmp	.L237
.L187:
	movl	$646, %eax
	jmp	.L237
.L186:
	movl	$647, %eax
	jmp	.L237
.L185:
	movl	$648, %eax
	jmp	.L237
.L184:
	movl	$649, %eax
	jmp	.L237
.L183:
	movl	$650, %eax
	jmp	.L237
.L182:
	movl	$651, %eax
	jmp	.L237
.L181:
	movl	$652, %eax
	jmp	.L237
.L180:
	movl	$653, %eax
	jmp	.L237
.L179:
	movl	$654, %eax
	jmp	.L237
.L178:
	movl	$655, %eax
	jmp	.L237
.L177:
	movl	$660, %eax
	jmp	.L237
.L176:
	movl	$661, %eax
	jmp	.L237
.L175:
	movl	$662, %eax
	jmp	.L237
.L174:
	movl	$663, %eax
	jmp	.L237
.L173:
	movl	$664, %eax
	jmp	.L237
.L172:
	movl	$665, %eax
	jmp	.L237
.L171:
	movl	$666, %eax
	jmp	.L237
.L170:
	movl	$667, %eax
	jmp	.L237
.L169:
	movl	$668, %eax
	jmp	.L237
.L168:
	movl	$669, %eax
	jmp	.L237
.L167:
	movl	$670, %eax
	jmp	.L237
.L166:
	movl	$671, %eax
	jmp	.L237
.L165:
	movl	$672, %eax
	jmp	.L237
.L164:
	movl	$673, %eax
	jmp	.L237
.L163:
	movl	$674, %eax
	jmp	.L237
.L162:
	movl	$675, %eax
	jmp	.L237
.L161:
	movl	$680, %eax
	jmp	.L237
.L160:
	movl	$690, %eax
	jmp	.L237
.L159:
	movl	$691, %eax
	jmp	.L237
.L158:
	movl	$692, %eax
	jmp	.L237
.L157:
	movl	$693, %eax
	jmp	.L237
.L156:
	movl	$694, %eax
	jmp	.L237
.L155:
	movl	$695, %eax
	jmp	.L237
.L154:
	movl	$153, %eax
	jmp	.L237
.L153:
	movl	$153, %eax
	jmp	.L237
.L152:
	movl	$152, %eax
	jmp	.L237
.L151:
	movl	$80, %eax
	jmp	.L237
.L150:
	movl	$80, %eax
	jmp	.L237
.L149:
	movl	$88, %eax
	jmp	.L237
.L148:
	movl	$88, %eax
	jmp	.L237
.L147:
	movl	$88, %eax
	jmp	.L237
.L146:
	movl	$88, %eax
	jmp	.L237
.L145:
	movl	$232, %eax
	jmp	.L237
.L144:
	movl	$195, %eax
	jmp	.L237
.L143:
	movl	$233, %eax
	jmp	.L237
.L142:
	movl	$116, %eax
	jmp	.L237
.L141:
	movl	$117, %eax
	jmp	.L237
.L140:
	movl	$127, %eax
	jmp	.L237
.L139:
	movl	$125, %eax
	jmp	.L237
.L138:
	movl	$124, %eax
	jmp	.L237
.L137:
	movl	$126, %eax
	jmp	.L237
.L136:
	movl	$137, %eax
	jmp	.L237
.L135:
	movl	$137, %eax
	jmp	.L237
.L134:
	movl	$137, %eax
	jmp	.L237
.L133:
	movl	$136, %eax
	jmp	.L237
.L132:
	movl	$141, %eax
	jmp	.L237
.L131:
	movl	$141, %eax
	jmp	.L237
.L130:
	movl	$141, %eax
	jmp	.L237
.L129:
	movl	$1, %eax
	jmp	.L237
.L128:
	movl	$3, %eax
	jmp	.L237
.L127:
	movl	$102, %eax
	jmp	.L237
.L126:
	movl	$0, %eax
	jmp	.L237
.L125:
	movl	$41, %eax
	jmp	.L237
.L124:
	movl	$43, %eax
	jmp	.L237
.L123:
	movl	$102, %eax
	jmp	.L237
.L122:
	movl	$40, %eax
	jmp	.L237
.L121:
	movl	$247, %eax
	jmp	.L237
.L120:
	movl	$247, %eax
	jmp	.L237
.L119:
	movl	$102, %eax
	jmp	.L237
.L118:
	movl	$246, %eax
	jmp	.L237
.L117:
	movl	$15, %eax
	jmp	.L237
.L116:
	movl	$105, %eax
	jmp	.L237
.L115:
	movl	$102, %eax
	jmp	.L237
.L114:
	movl	$107, %eax
	jmp	.L237
.L113:
	movl	$247, %eax
	jmp	.L237
.L112:
	movl	$247, %eax
	jmp	.L237
.L111:
	movl	$102, %eax
	jmp	.L237
.L110:
	movl	$246, %eax
	jmp	.L237
.L109:
	movl	$247, %eax
	jmp	.L237
.L108:
	movl	$247, %eax
	jmp	.L237
.L107:
	movl	$102, %eax
	jmp	.L237
.L106:
	movl	$246, %eax
	jmp	.L237
.L105:
	movl	$33, %eax
	jmp	.L237
.L104:
	movl	$35, %eax
	jmp	.L237
.L103:
	movl	$102, %eax
	jmp	.L237
.L102:
	movl	$32, %eax
	jmp	.L237
.L101:
	movl	$9, %eax
	jmp	.L237
.L100:
	movl	$11, %eax
	jmp	.L237
.L99:
	movl	$102, %eax
	jmp	.L237
.L98:
	movl	$8, %eax
	jmp	.L237
.L97:
	movl	$49, %eax
	jmp	.L237
.L96:
	movl	$51, %eax
	jmp	.L237
.L95:
	movl	$102, %eax
	jmp	.L237
.L94:
	movl	$48, %eax
	jmp	.L237
.L93:
	movl	$247, %eax
	jmp	.L237
.L92:
	movl	$247, %eax
	jmp	.L237
.L91:
	movl	$102, %eax
	jmp	.L237
.L90:
	movl	$246, %eax
	jmp	.L237
.L89:
	movl	$247, %eax
	jmp	.L237
.L88:
	movl	$247, %eax
	jmp	.L237
.L87:
	movl	$102, %eax
	jmp	.L237
.L86:
	movl	$246, %eax
	jmp	.L237
.L85:
	movl	$209, %eax
	jmp	.L237
.L84:
	movl	$211, %eax
	jmp	.L237
.L83:
	movl	$102, %eax
	jmp	.L237
.L82:
	movl	$208, %eax
	jmp	.L237
.L81:
	movl	$209, %eax
	jmp	.L237
.L80:
	movl	$211, %eax
	jmp	.L237
.L79:
	movl	$102, %eax
	jmp	.L237
.L78:
	movl	$208, %eax
	jmp	.L237
.L77:
	movl	$209, %eax
	jmp	.L237
.L76:
	movl	$211, %eax
	jmp	.L237
.L75:
	movl	$102, %eax
	jmp	.L237
.L74:
	movl	$208, %eax
	jmp	.L237
.L73:
	movl	$193, %eax
	jmp	.L237
.L72:
	movl	$193, %eax
	jmp	.L237
.L71:
	movl	$102, %eax
	jmp	.L237
.L70:
	movl	$192, %eax
	jmp	.L237
.L69:
	movl	$193, %eax
	jmp	.L237
.L68:
	movl	$193, %eax
	jmp	.L237
.L67:
	movl	$102, %eax
	jmp	.L237
.L66:
	movl	$192, %eax
	jmp	.L237
.L65:
	movl	$57, %eax
	jmp	.L237
.L64:
	movl	$59, %eax
	jmp	.L237
.L63:
	movl	$102, %eax
	jmp	.L237
.L62:
	movl	$56, %eax
	jmp	.L237
.L61:
	movl	$133, %eax
	jmp	.L237
.L60:
	movl	$169, %eax
	jmp	.L237
.L59:
	movl	$102, %eax
	jmp	.L237
.L58:
	movl	$132, %eax
	jmp	.L237
.L57:
	movl	$144, %eax
	jmp	.L237
.L56:
	movl	$3845, %eax
	jmp	.L237
.L55:
	movl	$201, %eax
	jmp	.L237
.L54:
	movl	$300, %eax
	jmp	.L237
.L53:
	movl	$301, %eax
	jmp	.L237
.L52:
	movl	$302, %eax
	jmp	.L237
.L51:
	movl	$303, %eax
	jmp	.L237
.L50:
	movl	$304, %eax
	jmp	.L237
.L49:
	movl	$305, %eax
	jmp	.L237
.L48:
	movl	$320, %eax
	jmp	.L237
.L47:
	movl	$313, %eax
	jmp	.L237
.L46:
	movl	$310, %eax
	jmp	.L237
.L45:
	movl	$311, %eax
	jmp	.L237
.L44:
	movl	$312, %eax
	jmp	.L237
.L43:
	movl	$330, %eax
	jmp	.L237
.L42:
	movl	$331, %eax
	jmp	.L237
.L41:
	movl	$332, %eax
	jmp	.L237
.L40:
	movl	$337, %eax
	jmp	.L237
.L39:
	movl	$336, %eax
	jmp	.L237
.L38:
	movl	$338, %eax
	jmp	.L237
.L37:
	movl	$406, %eax
	jmp	.L237
.L36:
	movl	$407, %eax
	jmp	.L237
.L35:
	movl	$408, %eax
	jmp	.L237
.L32:
	movl	$333, %eax
	jmp	.L237
.L31:
	movl	$334, %eax
	jmp	.L237
.L30:
	movl	$335, %eax
	jmp	.L237
.L29:
	movl	$403, %eax
	jmp	.L237
.L28:
	movl	$403, %eax
	jmp	.L237
.L27:
	movl	$400, %eax
	jmp	.L237
.L26:
	movl	$401, %eax
	jmp	.L237
.L25:
	movl	$401, %eax
	jmp	.L237
.L24:
	movl	$405, %eax
	jmp	.L237
.L23:
	movl	$402, %eax
	jmp	.L237
.L21:
	movl	$500, %eax
	jmp	.L237
.L20:
	movq	yyout(%rip), %rdx
	movl	yyleng(%rip), %eax
	movslq	%eax, %rsi
	movq	yytext(%rip), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movq	%rax, %rdi
	call	fwrite@PLT
	jmp	.L236
.L17:
	movl	$0, %eax
	jmp	.L237
.L19:
	movq	yytext(%rip), %rax
	movq	-32(%rbp), %rdx
	subq	%rax, %rdx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -40(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	56(%rax), %eax
	testl	%eax, %eax
	jne	.L238
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yyin(%rip), %rdx
	movq	%rdx, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$1, 56(%rax)
.L238:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rax, %rdx
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, %rdx
	jb	.L239
	movq	yytext(%rip), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	movl	%eax, %edi
	call	yy_try_NUL_trans
	movl	%eax, -36(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L240
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -32(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L12
.L240:
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -32(%rbp)
	jmp	.L13
.L239:
	call	yy_get_next_buffer
	cmpl	$2, %eax
	je	.L241
	cmpl	$2, %eax
	jg	.L246
	testl	%eax, %eax
	je	.L243
	cmpl	$1, %eax
	jne	.L246
	movl	$0, yy_did_buffer_switch_on_eof(%rip)
	movq	yytext(%rip), %rax
	movq	%rax, yy_c_buf_p(%rip)
	movl	yy_start(%rip), %eax
	subl	$1, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	$217, %eax
	movl	%eax, -44(%rbp)
	jmp	.L15
.L243:
	movq	yytext(%rip), %rdx
	movl	-40(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -48(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L12
.L241:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_previous_state
	movl	%eax, -48(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -24(%rbp)
	jmp	.L13
.L16:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L245:
	nop
	jmp	.L244
.L246:
	nop
.L236:
	jmp	.L244
.L237:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	yylex, .-yylex
	.section	.rodata
	.align 8
.LC1:
	.string	"fatal flex scanner internal error--end of buffer missed"
	.align 8
.LC2:
	.string	"fatal error - scanner input buffer overflow"
.LC3:
	.string	"input in flex scanner failed"
	.align 8
.LC4:
	.string	"out of dynamic memory in yy_get_next_buffer()"
	.text
	.type	yy_get_next_buffer, @function
yy_get_next_buffer:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	addq	%rax, %rdx
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, %rdx
	jnb	.L248
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L248:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	52(%rax), %eax
	testl	%eax, %eax
	jne	.L249
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	cmpq	$1, %rdx
	jne	.L250
	movl	$1, %eax
	jmp	.L251
.L250:
	movl	$2, %eax
	jmp	.L251
.L249:
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	movl	%edx, %eax
	subl	$1, %eax
	movl	%eax, -56(%rbp)
	movl	$0, -76(%rbp)
	jmp	.L252
.L253:
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -40(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	addl	$1, -76(%rbp)
.L252:
	movl	-76(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L253
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	56(%rax), %eax
	cmpl	$2, %eax
	jne	.L254
	movl	$0, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
	jmp	.L255
.L254:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	subl	-56(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	.L256
.L262:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	yy_c_buf_p(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	subq	%rax, %rdx
	movl	%edx, -52(%rbp)
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L257
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	addl	%eax, %eax
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jg	.L258
	movq	-24(%rbp), %rax
	movl	24(%rax), %edx
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	leal	7(%rax), %ecx
	testl	%eax, %eax
	cmovs	%ecx, %eax
	sarl	$3, %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 24(%rax)
	jmp	.L259
.L258:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	leal	(%rax,%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 24(%rax)
.L259:
	movq	-24(%rbp), %rax
	movl	24(%rax), %eax
	addl	$2, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yyrealloc
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	jmp	.L260
.L257:
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
.L260:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L261
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L261:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	subl	-56(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -68(%rbp)
.L256:
	cmpl	$0, -68(%rbp)
	jle	.L262
	cmpl	$8192, -68(%rbp)
	jle	.L263
	movl	$8192, -68(%rbp)
.L263:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	36(%rax), %eax
	testl	%eax, %eax
	je	.L264
	movl	$42, -64(%rbp)
	movl	$0, -60(%rbp)
	jmp	.L265
.L267:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rcx
	movl	-60(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rcx, %rdx
	addq	%rdx, %rax
	movl	-64(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -60(%rbp)
.L265:
	movl	-60(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jge	.L266
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	getc@PLT
	movl	%eax, -64(%rbp)
	cmpl	$-1, -64(%rbp)
	je	.L266
	cmpl	$10, -64(%rbp)
	jne	.L267
.L266:
	cmpl	$10, -64(%rbp)
	jne	.L268
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rsi
	movl	-60(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -60(%rbp)
	cltq
	addq	%rsi, %rax
	addq	%rcx, %rax
	movl	-64(%rbp), %edx
	movb	%dl, (%rax)
.L268:
	cmpl	$-1, -64(%rbp)
	jne	.L269
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L269
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L269:
	movl	-60(%rbp), %eax
	movl	%eax, yy_n_chars(%rip)
	jmp	.L270
.L264:
	call	__errno_location@PLT
	movl	$0, (%rax)
	jmp	.L271
.L273:
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L272
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L272:
	call	__errno_location@PLT
	movl	$0, (%rax)
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	clearerr@PLT
.L271:
	movq	yyin(%rip), %rdx
	movl	-68(%rbp), %eax
	cltq
	movq	yy_buffer_stack(%rip), %rcx
	movq	yy_buffer_stack_top(%rip), %rsi
	salq	$3, %rsi
	addq	%rsi, %rcx
	movq	(%rcx), %rcx
	movq	8(%rcx), %rsi
	movl	-56(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx), %rdi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$1, %esi
	call	fread@PLT
	movl	%eax, yy_n_chars(%rip)
	movl	yy_n_chars(%rip), %eax
	testl	%eax, %eax
	jne	.L270
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	jne	.L273
.L270:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L255:
	movl	yy_n_chars(%rip), %eax
	testl	%eax, %eax
	jne	.L274
	cmpl	$0, -56(%rbp)
	jne	.L275
	movl	$1, -72(%rbp)
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	yyrestart
	jmp	.L276
.L275:
	movl	$2, -72(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$2, 56(%rax)
	jmp	.L276
.L274:
	movl	$0, -72(%rbp)
.L276:
	movl	yy_n_chars(%rip), %edx
	movl	-56(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cmpl	%eax, %ecx
	jle	.L277
	movl	yy_n_chars(%rip), %edx
	movl	-56(%rbp), %eax
	addl	%eax, %edx
	movl	yy_n_chars(%rip), %eax
	sarl	%eax
	addl	%edx, %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	yy_buffer_stack(%rip), %rcx
	movq	yy_buffer_stack_top(%rip), %rsi
	salq	$3, %rsi
	addq	%rsi, %rcx
	movq	(%rcx), %rbx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yyrealloc
	movq	%rax, 8(%rbx)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L278
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L278:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-44(%rbp), %edx
	subl	$2, %edx
	movl	%edx, 24(%rax)
.L277:
	movl	yy_n_chars(%rip), %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, yytext(%rip)
	movl	-72(%rbp), %eax
.L251:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	yy_get_next_buffer, .-yy_get_next_buffer
	.type	yy_get_previous_state, @function
yy_get_previous_state:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	yy_start(%rip), %eax
	movl	%eax, -12(%rbp)
	movq	yytext(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L280
.L286:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L281
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	cltq
	leaq	yy_ec(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	jmp	.L282
.L281:
	movl	$1, %eax
.L282:
	movb	%al, -13(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L284
	movl	-12(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L284
.L285:
	movl	-12(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -12(%rbp)
	cmpl	$666, -12(%rbp)
	jle	.L284
	movzbl	-13(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -13(%rbp)
.L284:
	movl	-12(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-13(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, -12(%rbp)
	jne	.L285
	movl	-12(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-13(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -12(%rbp)
	addq	$1, -8(%rbp)
.L280:
	movq	yy_c_buf_p(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jb	.L286
	movl	-12(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	yy_get_previous_state, .-yy_get_previous_state
	.type	yy_try_NUL_trans, @function
yy_try_NUL_trans:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -8(%rbp)
	movb	$1, -13(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_accept(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	testw	%ax, %ax
	je	.L290
	movl	-20(%rbp), %eax
	movl	%eax, yy_last_accepting_state(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, yy_last_accepting_cpos(%rip)
	jmp	.L290
.L291:
	movl	-20(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_def(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -20(%rbp)
	cmpl	$666, -20(%rbp)
	jle	.L290
	movzbl	-13(%rbp), %eax
	cltq
	leaq	yy_meta(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movb	%al, -13(%rbp)
.L290:
	movl	-20(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-13(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_chk(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cmpl	%eax, -20(%rbp)
	jne	.L291
	movl	-20(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_base(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movzbl	-13(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	yy_nxt(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	movl	%eax, -20(%rbp)
	cmpl	$666, -20(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L292
	movl	-20(%rbp), %eax
	jmp	.L294
.L292:
	movl	$0, %eax
.L294:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	yy_try_NUL_trans, .-yy_try_NUL_trans
	.section	.rodata
	.align 8
.LC5:
	.string	"flex scanner push-back overflow"
	.text
	.type	yyunput, @function
yyunput:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, -24(%rbp)
	movzbl	yy_hold_char(%rip), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	addq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L296
	movl	yy_n_chars(%rip), %eax
	addl	$2, %eax
	movl	%eax, -28(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	cltq
	addq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	.L297
.L298:
	subq	$1, -8(%rbp)
	subq	$1, -16(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movb	%dl, (%rax)
.L297:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	cmpq	-8(%rbp), %rax
	jb	.L298
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
	cltq
	addq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
	cltq
	addq	%rax, -48(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	24(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	addq	$2, %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L296
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L296:
	subq	$1, -24(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	movq	-48(%rbp), %rax
	movq	%rax, yytext(%rip)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movq	-24(%rbp), %rax
	movq	%rax, yy_c_buf_p(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	yyunput, .-yyunput
	.type	input, @function
input:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L300
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rdx
	movl	yy_n_chars(%rip), %eax
	cltq
	addq	%rdx, %rax
	movq	yy_c_buf_p(%rip), %rdx
	cmpq	%rax, %rdx
	jnb	.L301
	movq	yy_c_buf_p(%rip), %rax
	movb	$0, (%rax)
	jmp	.L300
.L301:
	movq	yy_c_buf_p(%rip), %rdx
	movq	yytext(%rip), %rax
	subq	%rax, %rdx
	movl	%edx, -8(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	call	yy_get_next_buffer
	cmpl	$2, %eax
	je	.L302
	cmpl	$2, %eax
	jg	.L300
	testl	%eax, %eax
	je	.L303
	cmpl	$1, %eax
	je	.L306
	jmp	.L300
.L302:
	movq	yyin(%rip), %rax
	movq	%rax, %rdi
	call	yyrestart
.L306:
	movl	$0, %eax
	jmp	.L305
.L303:
	movq	yytext(%rip), %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, yy_c_buf_p(%rip)
	nop
.L300:
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	movq	yy_c_buf_p(%rip), %rax
	movb	$0, (%rax)
	movq	yy_c_buf_p(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	movl	-4(%rbp), %eax
.L305:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	input, .-input
	.globl	yyrestart
	.type	yyrestart, @function
yyrestart:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L308
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L309
.L308:
	call	yyensure_buffer_stack
	movq	yyin(%rip), %rax
	movq	yy_buffer_stack(%rip), %rdx
	movq	yy_buffer_stack_top(%rip), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movl	$16384, %esi
	movq	%rax, %rdi
	call	yy_create_buffer
	movq	%rax, (%rbx)
.L309:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L310
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L311
.L310:
	movl	$0, %eax
.L311:
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yy_init_buffer
	call	yy_load_buffer_state
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	yyrestart, .-yyrestart
	.globl	yy_switch_to_buffer
	.type	yy_switch_to_buffer, @function
yy_switch_to_buffer:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	call	yyensure_buffer_stack
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L313
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L314
.L313:
	movl	$0, %eax
.L314:
	cmpq	-8(%rbp), %rax
	je	.L318
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L317
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L317
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yy_c_buf_p(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L317:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L312
.L318:
	nop
.L312:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	yy_switch_to_buffer, .-yy_switch_to_buffer
	.type	yy_load_buffer_state, @function
yy_load_buffer_state:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	28(%rax), %eax
	movl	%eax, yy_n_chars(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	%rax, yy_c_buf_p(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movq	%rax, yytext(%rip)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, yyin(%rip)
	movq	yy_c_buf_p(%rip), %rax
	movzbl	(%rax), %eax
	movb	%al, yy_hold_char(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	yy_load_buffer_state, .-yy_load_buffer_state
	.section	.rodata
	.align 8
.LC6:
	.string	"out of dynamic memory in yy_create_buffer()"
	.text
	.globl	yy_create_buffer
	.type	yy_create_buffer, @function
yy_create_buffer:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$64, %edi
	call	yyalloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L321
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L321:
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	addl	$2, %eax
	cltq
	movq	%rax, %rdi
	call	yyalloc
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L322
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L322:
	movq	-8(%rbp), %rax
	movl	$1, 32(%rax)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yy_init_buffer
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	yy_create_buffer, .-yy_create_buffer
	.globl	yy_delete_buffer
	.type	yy_delete_buffer, @function
yy_delete_buffer:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L331
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L327
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L328
.L327:
	movl	$0, %eax
.L328:
	cmpq	-8(%rbp), %rax
	jne	.L329
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
.L329:
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	je	.L330
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	yyfree
.L330:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	yyfree
	jmp	.L324
.L331:
	nop
.L324:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	yy_delete_buffer, .-yy_delete_buffer
	.type	yy_init_buffer, @function
yy_init_buffer:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	yy_flush_buffer
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movl	$1, 52(%rax)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L333
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L334
.L333:
	movl	$0, %eax
.L334:
	cmpq	-24(%rbp), %rax
	je	.L335
	movq	-24(%rbp), %rax
	movl	$1, 44(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 48(%rax)
.L335:
	cmpq	$0, -32(%rbp)
	je	.L336
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fileno@PLT
	movl	%eax, %edi
	call	isatty@PLT
	testl	%eax, %eax
	jle	.L336
	movl	$1, %edx
	jmp	.L337
.L336:
	movl	$0, %edx
.L337:
	movq	-24(%rbp), %rax
	movl	%edx, 36(%rax)
	call	__errno_location@PLT
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	yy_init_buffer, .-yy_init_buffer
	.globl	yy_flush_buffer
	.type	yy_flush_buffer, @function
yy_flush_buffer:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L343
	movq	-8(%rbp), %rax
	movl	$0, 28(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 40(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 56(%rax)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L341
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L342
.L341:
	movl	$0, %eax
.L342:
	cmpq	-8(%rbp), %rax
	jne	.L338
	call	yy_load_buffer_state
	jmp	.L338
.L343:
	nop
.L338:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	yy_flush_buffer, .-yy_flush_buffer
	.globl	yypush_buffer_state
	.type	yypush_buffer_state, @function
yypush_buffer_state:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L349
	call	yyensure_buffer_stack
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L347
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L347
	movq	yy_c_buf_p(%rip), %rax
	movzbl	yy_hold_char(%rip), %edx
	movb	%dl, (%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	yy_c_buf_p(%rip), %rdx
	movq	%rdx, 16(%rax)
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	yy_n_chars(%rip), %edx
	movl	%edx, 28(%rax)
.L347:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L348
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L348
	movq	yy_buffer_stack_top(%rip), %rax
	addq	$1, %rax
	movq	%rax, yy_buffer_stack_top(%rip)
.L348:
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L344
.L349:
	nop
.L344:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	yypush_buffer_state, .-yypush_buffer_state
	.globl	yypop_buffer_state
	.type	yypop_buffer_state, @function
yypop_buffer_state:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L357
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L357
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L354
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L355
.L354:
	movl	$0, %eax
.L355:
	movq	%rax, %rdi
	call	yy_delete_buffer
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	yy_buffer_stack_top(%rip), %rax
	testq	%rax, %rax
	je	.L356
	movq	yy_buffer_stack_top(%rip), %rax
	subq	$1, %rax
	movq	%rax, yy_buffer_stack_top(%rip)
.L356:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L350
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L350
	call	yy_load_buffer_state
	movl	$1, yy_did_buffer_switch_on_eof(%rip)
	jmp	.L350
.L357:
	nop
.L350:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	yypop_buffer_state, .-yypop_buffer_state
	.section	.rodata
	.align 8
.LC7:
	.string	"out of dynamic memory in yyensure_buffer_stack()"
	.text
	.type	yyensure_buffer_stack, @function
yyensure_buffer_stack:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L359
	movq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	yyalloc
	movq	%rax, yy_buffer_stack(%rip)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L360
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L360:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-8(%rbp), %rax
	movq	%rax, yy_buffer_stack_max(%rip)
	movq	$0, yy_buffer_stack_top(%rip)
	jmp	.L358
.L359:
	movq	yy_buffer_stack_max(%rip), %rax
	subq	$1, %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	cmpq	%rax, %rdx
	jb	.L358
	movq	$8, -16(%rbp)
	movq	yy_buffer_stack_max(%rip), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yyrealloc
	movq	%rax, yy_buffer_stack(%rip)
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	jne	.L362
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L362:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_max(%rip), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-8(%rbp), %rax
	movq	%rax, yy_buffer_stack_max(%rip)
.L358:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	yyensure_buffer_stack, .-yyensure_buffer_stack
	.section	.rodata
	.align 8
.LC8:
	.string	"out of dynamic memory in yy_scan_buffer()"
	.text
	.globl	yy_scan_buffer
	.type	yy_scan_buffer, @function
yy_scan_buffer:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$1, -32(%rbp)
	jbe	.L364
	movq	-32(%rbp), %rax
	leaq	-2(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L364
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L365
.L364:
	movl	$0, %eax
	jmp	.L366
.L365:
	movl	$64, %edi
	call	yyalloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L367
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L367:
	movq	-32(%rbp), %rax
	subl	$2, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movl	24(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 28(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 40(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 52(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	yy_switch_to_buffer
	movq	-8(%rbp), %rax
.L366:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	yy_scan_buffer, .-yy_scan_buffer
	.globl	yy_scan_string
	.type	yy_scan_string, @function
yy_scan_string:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	yy_scan_bytes
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	yy_scan_string, .-yy_scan_string
	.section	.rodata
	.align 8
.LC9:
	.string	"out of dynamic memory in yy_scan_bytes()"
.LC10:
	.string	"bad buffer in yy_scan_bytes()"
	.text
	.globl	yy_scan_bytes
	.type	yy_scan_bytes, @function
yy_scan_bytes:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	cltq
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	yyalloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L371
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L371:
	movl	$0, -28(%rbp)
	jmp	.L372
.L373:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rcx
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -28(%rbp)
.L372:
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L373
	movl	-44(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	-44(%rbp), %edx
	movslq	%edx, %rcx
	movq	-16(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	yy_scan_buffer
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L374
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	yy_fatal_error
.L374:
	movq	-8(%rbp), %rax
	movl	$1, 32(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	yy_scan_bytes, .-yy_scan_bytes
	.section	.rodata
.LC11:
	.string	"%s\n"
	.text
	.type	yy_fatal_error, @function
yy_fatal_error:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$2, %edi
	call	exit@PLT
	.cfi_endproc
.LFE25:
	.size	yy_fatal_error, .-yy_fatal_error
	.globl	yyget_lineno
	.type	yyget_lineno, @function
yyget_lineno:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	yylineno(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	yyget_lineno, .-yyget_lineno
	.globl	yyget_in
	.type	yyget_in, @function
yyget_in:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	yyin(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	yyget_in, .-yyget_in
	.globl	yyget_out
	.type	yyget_out, @function
yyget_out:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	yyout(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	yyget_out, .-yyget_out
	.globl	yyget_leng
	.type	yyget_leng, @function
yyget_leng:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	yyleng(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	yyget_leng, .-yyget_leng
	.globl	yyget_text
	.type	yyget_text, @function
yyget_text:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	yytext(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	yyget_text, .-yyget_text
	.globl	yyset_lineno
	.type	yyset_lineno, @function
yyset_lineno:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, yylineno(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	yyset_lineno, .-yyset_lineno
	.globl	yyset_in
	.type	yyset_in, @function
yyset_in:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, yyin(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	yyset_in, .-yyset_in
	.globl	yyset_out
	.type	yyset_out, @function
yyset_out:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, yyout(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	yyset_out, .-yyset_out
	.globl	yyget_debug
	.type	yyget_debug, @function
yyget_debug:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	yy_flex_debug(%rip), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	yyget_debug, .-yyget_debug
	.globl	yyset_debug
	.type	yyset_debug, @function
yyset_debug:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, yy_flex_debug(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	yyset_debug, .-yyset_debug
	.type	yy_init_globals, @function
yy_init_globals:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$0, yy_buffer_stack(%rip)
	movq	$0, yy_buffer_stack_top(%rip)
	movq	$0, yy_buffer_stack_max(%rip)
	movq	$0, yy_c_buf_p(%rip)
	movl	$0, yy_init(%rip)
	movl	$0, yy_start(%rip)
	movq	$0, yyin(%rip)
	movq	$0, yyout(%rip)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	yy_init_globals, .-yy_init_globals
	.globl	yylex_destroy
	.type	yylex_destroy, @function
yylex_destroy:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	jmp	.L396
.L400:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L397
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L398
.L397:
	movl	$0, %eax
.L398:
	movq	%rax, %rdi
	call	yy_delete_buffer
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	call	yypop_buffer_state
.L396:
	movq	yy_buffer_stack(%rip), %rax
	testq	%rax, %rax
	je	.L399
	movq	yy_buffer_stack(%rip), %rax
	movq	yy_buffer_stack_top(%rip), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L400
.L399:
	movq	yy_buffer_stack(%rip), %rax
	movq	%rax, %rdi
	call	yyfree
	movq	$0, yy_buffer_stack(%rip)
	call	yy_init_globals
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	yylex_destroy, .-yylex_destroy
	.globl	yyalloc
	.type	yyalloc, @function
yyalloc:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	yyalloc, .-yyalloc
	.globl	yyrealloc
	.type	yyrealloc, @function
yyrealloc:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	yyrealloc, .-yyrealloc
	.globl	yyfree
	.type	yyfree, @function
yyfree:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	yyfree, .-yyfree
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
