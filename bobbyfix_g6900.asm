	.if (* < $0800) { .fill $0800-*, $FF }
	* = $0800
// Zeropage vectors
.label zp02 = $02  // (240)
.label zp04 = $04  // (219)
.label zp08 = $08  // (30)
.label zp0B = $0B  // (20)
.label zp0D = $0D  // (59)
.label zp14 = $14  // (3)
.label zp17 = $17  // (3)
.label zp1B = $1B  // (9)
.label zp1F = $1F  // (35)
.label zp77 = $77  // (5)
//---------
// Zeropage variables
.label zp06 = $06  // (189)
.label zp07 = $07  // (277)
.label zp0A = $0A  // (34)
.label zp0F = $0F  // (26)
.label zp12 = $12  // (6)
.label zp16 = $16  // (4)
.label zp19 = $19  // (3)
.label zp1A = $1A  // (3)
.label zp21 = $21  // (3)
.label zp2A = $2A  // (2)
.label zp2B = $2B  // (3)
.label zp2C = $2C  // (4)
.label zp2D = $2D  // (2)
.label zp2E = $2E  // (1)
.label zp2F = $2F  // (3)
.label zp30 = $30  // (4)
.label zp71 = $71  // (3)
.label zp72 = $72  // (6)
.label zp73 = $73  // (4)
.label zp74 = $74  // (4)
.label zp75 = $75  // (4)
.label zp76 = $76  // (16)
.label zp79 = $79  // (1)
.label zp7A = $7A  // (2)
.label zp7B = $7B  // (1)
.label zp7C = $7C  // (1)
.label zpD0 = $D0  // (3)
.label zpD1 = $D1  // (1)
//---------
.label font = $F800
.label temp_gfx = $E000
.label bitmap = $A000
.label colmap = $D800
.label splat = $C800
//---------
V_0800: .byte $4C,$36,$08
//;
S_0803: jmp L_1997
//;
//$0806  --------
	.byte $4C,$61,$0E
	.byte $4C,$D9,$19

V_080C: .byte $32
V_080D: .byte $18
V_080E: .byte $EF
V_080F: .byte $18
V_0810: .byte $83
V_0811: .byte $18
V_0812: .byte $A5
V_0813: .byte $18
V_0814: .byte $EB
V_0815: .byte $18,$5A,$18
//;
S_0818: jmp L_17F5
//;
//$081B  --------
	.byte $4C,$94,$09,$4C,$FB,$09
//;
L_0821: jmp L_0F88  // screen char mem
//;
L_0824: jmp L_1384
//;
L_0827: lda #$64
	sta V_7C02
	lda #$49  // "I"
	ldy #$03
B_0830: sta V_7C7E,y
	dey
	bpl B_0830
	jsr S_0854  // screen colour mem
	lda V_7C02
	cmp #$65
	bne B_0843
	jmp L_198F
//;
B_0843: cmp #$66
	bne B_084A
	jmp $0000
//;
B_084A: cmp #$64
	bne L_086F
	jsr S_13D6
	jmp L_086F  // screen colour mem
//;
S_0854: lda #$00
	sta V_6500
	sta V_7D90
//;
	lda #$01  // $6501 to $0D (16bit value)
	sta zp0D
	lda #$65
	sta zp0D+1
	lda #$91  // $7D91 to $7D8E (16bit value)
	sta V_7D8E
	lda #$7D
	sta V_7D8F
	rts
//$086F  --------
L_086F: jsr S_0854  // screen colour mem
	jsr S_1ADE
	lda #$00
	sta V_7C47
	sta V_7C4E
	tay
	jsr S_0994  // screen colour mem
//;
	lda VAR_CRUSH_VALUE
//;lda #$00		; cheat!!!
//;nop
//;
	beq B_08C1
//;
	cmp #$03
	bcc L_08BA
	cmp #$0A
	bcs L_08BA
	sta zp07
	jsr S_1628
	lda V_7C69
	cmp #$08
	bcs B_08A5
	cmp #$00
	beq L_08BA
	and #$01
	bne B_08B5
	jmp L_08BA  // screen colour mem
//;
B_08A5: cmp #$0C
	beq B_08B5
	cmp #$14
	beq B_08B5
	cmp #$1E
	beq B_08B5
	cmp #$10
	bne L_08BA
B_08B5: lda #$00
	jmp L_08BC  // screen colour mem
//;
L_08BA: lda #$20
L_08BC: sta V_7C47
//;
	lda #$03
B_08C1: sta V_7C02
	lda V_7CCB
	sta V_7CCA
	jsr S_3540
	lda V_7C5A
	sta V_7DF4
	lda V_7C5B
	sta V_7DF5
	lda V_7C5C
	sta V_7DF6
	lda V_7C5D
	sta V_7DF7
//;
	ldy #$00
	jsr S_09FB  // screen colour mem
	jsr S_147B
	jsr S_0C36  // screen char mem
//;
	lda V_7C67
	sta zp07
//;
	lda VAR_BROTHER_INDEX
	bne B_0901
//;
	lda zp07
	bne B_0901
//;
	jmp L_135A
//;
B_0901: lda V_7C77
	cmp zp07
	bne L_0965
//;
	ldy #$10
	lda #$20
	sta V_7C47
//;
	jsr S_0994  // screen colour mem
//;
	lda #$01
	sta V_7C02
//;
	lda V_7C78
	beq B_0921
//;
	lda #$03
	sta V_7C02
//;
B_0921: lda #$FF
	sta V_7C4E
	sta V_7C0E
	lda V_7CCC
	sta V_7CCA
	jsr S_3540
	lda V_7C6A
	sta V_7DF4
	lda V_7C6B
	sta V_7DF5
	lda V_7C6C
	sta V_7DF6
	lda V_7C6D
	sta V_7DF7
//;
	ldy #$10
	jsr S_09FB  // screen colour mem
//;
	lda V_7C4F
	cmp #$19
	bcs B_0959
//;
	jsr S_1515
//;
B_0959: jsr S_1445
	jsr S_14E8
	jsr S_0ECE  // screen char mem
	jsr S_1072
L_0965: jsr S_1118
	jsr S_1AC0
	jsr S_19DF
	lda zp2C
	beq B_0976
	jsr S_12DE
	nop
B_0976: lda V_6500
	cmp #$01
	bcs B_0980
//;
	jsr SUB_DELAY  // screen colour mem
//;
B_0980: jsr S_1644
	jsr S_2D8F
	jsr S_9883
	jmp L_086F  // screen colour mem
//;
SUB_DELAY:
	ldy #$00
B_098E: ldx #$00
	dey
	bne B_098E
	rts
//$0994  --------
S_0994: lda V_7C5A,y
	sta V_7C40
	iny
	lda V_7C5A,y
	sta V_7C13
	iny
	lda V_7C5A,y
	sta V_7C41
	iny
	lda V_7C5A,y
	sta V_7C12
	iny
	lda V_7C5A,y
	sta V_7C0B
	iny
	lda V_7C5A,y
	sta V_7C0C
	iny
	iny
	lda V_7C5A,y
	sta V_7C1C
	iny
	lda V_7C5A,y
	sta V_7C1D
	iny
	lda V_7C5A,y
	sta V_7C1B
	iny
	lda V_7C5A,y
	sta V_7C24
	sta V_7C0F
	iny
	lda V_7C5A,y
	sta V_7C22
	iny
	lda V_7C5A,y
	sta V_7C45
	iny
	iny
	lda V_7C5A,y
	sta V_7C48
	iny
	lda V_7C5A,y
	sta V_7C05
	rts
//$09FB  --------
S_09FB: lda V_7C40
	sta V_7C5A,y
	iny
	lda V_7C13
	sta V_7C5A,y
	iny
	lda V_7C41
	sta V_7C5A,y
	iny
	lda V_7C12
	sta V_7C5A,y
	iny
	lda V_7C0B
	sta V_7C5A,y
	iny
	lda V_7C0C
	sta V_7C5A,y
	iny
	lda V_7C48
	cmp #$0A
	bcs B_0A32
	lda V_7C44
	sta V_7C5A,y
B_0A32: iny
	lda V_7C1C
	sta V_7C5A,y
	iny
	lda V_7C1D
	sta V_7C5A,y
	iny
	lda V_7C1B
	sta V_7C5A,y
	iny
	lda V_7C24
	sta V_7C5A,y
	iny
	lda V_7C22
	sta V_7C5A,y
	iny
	lda V_7C45
	sta V_7C5A,y
B_0A5C: rts
//$0A5D  --------
L_0A5D: lda V_7C5F
	sec
	sbc V_7C6F
	bpl B_0A6A
	eor #$FF
	adc #$01
B_0A6A: sta zp02+1
	cmp #$0B
	bcs B_0A5C
	lda V_7C6E
	sec
	sbc V_7C5E
	bpl B_0A7D
	eor #$FF
	adc #$01
B_0A7D: sta zp02
	cmp #$0B
	bcs B_0A5C
	ldx zp02
	lda V_42EE,x
	ldx zp02+1
	cmp V_42EE,x
	bcc B_0A92
	lda V_42EE,x
B_0A92: sta zp2A
	lda V_7C61
	sta zp07
	lda V_7C71
	sta zp06
	sec
	sbc zp07
	bpl B_0AA8
	eor #$FF
	adc #$01
	nop
B_0AA8: cmp #$0F
	bcs B_0AE1
	ldx #$05
	stx V_7C66
	stx V_7C76
	cmp #$08
	bcc B_0ABB
	jmp L_0C0B  // screen char mem
//;
B_0ABB: lda V_7C62
	cmp #$05
	bcc B_0AC5
	jmp L_0C06  // screen char mem
//;
B_0AC5: lda V_7C72
	cmp #$05
	bcc B_0ACF
	jmp L_0C06  // screen char mem
//;
B_0ACF: lda zp02
	cmp #$08
	bcs B_0AD8
	jsr S_0AE2  // screen colour mem
B_0AD8: lda zp02+1
	cmp #$08
	bcs B_0AE1
	jmp L_0B78  // screen colour mem
//;
B_0AE1: rts
//$0AE2  --------
S_0AE2: lda zp02+1
	pha
	lda zp02
	pha
	lda V_7C5A
	sta zp02
	lda V_7C5B
	sta zp02+1
	lda V_7C6A
	sta zp04
	lda V_7C6B
	sta zp04+1
	lda V_7C02
	cmp #$01
	bne B_0B06
	jmp L_107A
//;
B_0B06: lda zp02
	ora zp02+1
	ora zp04
	ora zp04+1
	bne B_0B13
	jmp L_0BFF
//;
B_0B13: lda V_7C2E
	and #$21
	beq B_0B1D
	jmp L_1593
//;
B_0B1D: lda zp04
	sta V_7C5A
	lda zp04+1
	sta V_7C5B
	lda zp02
	sta V_7C6A
	lda zp02+1
	sta V_7C6B
	jsr S_15A5
	lda #$00
	sta V_7C75
L_0B39: jsr S_2D92
	pla
	sta zp02
	pla
	sta zp02+1
	lda V_7C5F
	sta zp07
	lda V_7C6F
	sta zp06
	cmp zp07
	php
	lda zp07
	plp
	bcc B_0B66
	clc
	adc #$0B
	sta V_7C6F
	lda zp07
	cmp #$67
	bcc B_0B77
	lda #$66
	sta V_7C5F
	rts
//$0B66  --------
B_0B66: sec
	sbc #$0B
	sta V_7C6F
	lda zp07
	cmp #$0B
	bcs B_0B77
	lda #$0B
	sta V_7C5F
B_0B77: rts
//$0B78  --------
L_0B78: lda V_7C5C
	sta zp02
	lda V_7C5D
	sta zp02+1
	lda V_7C6C
	sta zp04
	lda V_7C13
	sta zp04+1
	lda V_7C02
	cmp #$01
	bne B_0B96
	jmp L_1087
//;
B_0B96: lda zp02
	ora zp02+1
	ora zp04
	ora zp04+1
	beq B_0BEC
	lda V_7C2F
	and #$21
	beq B_0BAA
	jmp L_155D
//;
B_0BAA: lda zp04
	sta V_7C5C
	lda zp04+1
	sta V_7C5D
	lda zp02
	sta V_7C6C
	lda zp02+1
	sta V_7C6D
	jsr S_15A5
	lda #$10
	sta V_7C75
L_0BC6: jsr S_2D92
	lda V_7C5E
	sta zp07
	lda V_7C6E
	sta zp06
	cmp zp07
	php
	lda zp07
	plp
	bcc B_0BED
	clc
	adc #$0B
	sta V_7C6E
	lda zp07
	cmp #$67
	bcc B_0BEC
	lda #$66
	sta V_7C5E
B_0BEC: rts
//$0BED  --------
B_0BED: sec
	sbc #$0B
	sta V_7C6E
	lda zp07
	cmp #$0B
	bcs B_0C05
	lda #$0B
	sta V_7C5E
	rts
//$0BFF  --------
L_0BFF: pla
	sta zp02
	pla
	sta zp02+1
B_0C05: rts
//$0C06  --------
L_0C06: lda V_7C61
	sta zp07
L_0C0B: lda #$00
	sta V_7C63
	sta V_7C73
	lda V_7C62
	ldy V_7C72
	sty V_7C62
	sta V_7C72
	lda zp07
	cmp zp06
	lda zp2A
	bcc B_0C2F
	clc
	adc zp06
	sta V_7C61
	rts
//$0C2E  --------
//$0C2E  --------
	.byte $EA
//;
B_0C2F: clc
	adc zp07
	sta V_7C71
	rts
//$0C36  --------
S_0C36: lda V_6570
	beq B_0C75
	sta zp07
	lda V_7C5F
	and #$0F
	sta zp04+1
	lda V_7C5E
	and #$0F
	sta zp04
	lda V_7C60
	sta zp06
	ldx #$01
B_0C52: lda zp07
	pha
	lda zp06
	pha
	cmp V_6570,x
	php
	inx
	plp
	bne B_0C68
	jsr S_0CC1  // screen char mem
	bne B_0C68
	jmp L_0C76  // screen char mem
//;
B_0C68: inx
	inx
	inx
	pla
	sta zp06
	pla
	sta zp07
	dec zp07
	bne B_0C52
B_0C75: rts
//$0C76  --------
L_0C76: lda #$05
	sta V_7C76
	sta zp2C
	txa
	pha
//;
	lda #$00
	sta V_6500
	sta V_7D90
//;
	lda #$01  // $6501 to $0D (16bit value)
	sta zp0D
	lda #$65
	sta zp0D+1
//;
	lda #$91  // $7D91 to $7D8E (16bit value)
	sta V_7D8E
	lda #$7D
	sta V_7D8F
//;
	jsr S_17BD
	jsr SUB_WRITE_BROTHERS_NAME  // !
	jsr S_1650
	jsr S_16AC
//;
	pla
	tax
	jsr S_0D2A  // screen char mem
//;
	lda #$05
	jsr S_2DB3
//;
	jsr S_2D8C
	pla
	sta zp06
	pla
	sta zp07
	pla
	pla
	jsr S_988C
	jmp L_0965  // screen colour mem
//;
//$0CC0  --------
	.byte $EA
//;
S_0CC1: lda V_7C45
	beq B_0D27
	lda V_6570,x
	and #$03
	sta zp07
	lda V_7C42
	sta zp06
	lda V_7C43
	beq B_0D03
	php
	lda zp06
	plp
	bpl B_0CF0
	cmp #$00
	bne B_0D29
	lda zp07
	cmp #$03
	bne B_0D29
	lda zp04
	cmp #$05
	bcs B_0D27
	lda #$00
	rts
//$0CF0  --------
B_0CF0: cmp #$00
	bne B_0D29
	lda zp07
	cmp #$02
	bne B_0D29
	lda zp04
	cmp #$05
	bcs B_0D27
	lda #$00
	rts
//$0D03  --------
B_0D03: lda zp06
	beq B_0D27
	php
	lda zp07
	plp
	bpl B_0D1A
	cmp #$01
	bne B_0D29
	lda zp04+1
	cmp #$05
	bcs B_0D27
	lda #$00
	rts
//$0D1A  --------
B_0D1A: cmp #$00
	bne B_0D29
	lda zp04+1
	cmp #$05
	bcs B_0D27
	lda #$00
	rts
//$0D27  --------
B_0D27: ora #$01
B_0D29: rts
//$0D2A  --------
S_0D2A: jsr S_0D6F  // screen char mem
	sta V_7C5E
	sta V_7C7A
	lda #$00
	sta V_6500
	sta V_7C60
	lda V_7DF4
	sta V_7C5A
	lda V_7DF5
	sta V_7C5B
	lda V_7DF6
	sta V_7C5C
	lda V_7DF7
	sta V_7C5D
	lda zp07
	sta V_7C5F
	sta V_7C7B
	inx
	lda V_6570,x
	sta V_7C67
	inx
	lda V_6570,x
	sta V_7C61
	sta V_7C7C
	jmp L_0D96  // screen char mem
//;
S_0D6F: lda V_6570,x
	and #$E0  // ?
	lsr
	sta zp07
	lda V_6570,x
	and #$1C
	asl  // mul * 4
	asl
	rts
//$0D7F  --------
B_0D7F: lda zp04
	sta zp19
	lda zp04+1
	sta zp1A
	ldy #$00
	lda (zp04),y
	sta zp02
	jmp L_0DC3  // screen char mem
//;
//$0D90  --------
	.byte $20,$BD,$17,$4C,$99,$0D
//;
L_0D96: jsr S_1AC9
//;
	lda #$91  // $6591 to $1B (16bit value)
	sta zp1B
	lda #$65
	sta zp1B+1
//;
	lda #$69
	sta V_0DF6 + 2  // screen char mem
	sta V_0E1A + 2  // screen char mem
	sta V_197A + 2
	sta V_1965 + 2
//;
	lda #$00
	tax
	sta V_6590
//;
B_0DB5: sta X_6900,x
	sta V_6A00,x
	dex
	bne B_0DB5
//;
	lda V_7C67
	sta zp02
L_0DC3: lda #$00
	sta zp02+1
	lda zp02
	pha
	clc
	asl
	rol zp02+1
	adc #$9A
	sta zp02
	lda zp02+1
	adc #$7E
	sta zp02+1
	ldy #$00
	lda (zp02),y
	sta zp04
	iny
	lda (zp02),y
	sta zp04+1
	pla
	cmp #$2A
	bcs B_0D7F
	jsr S_2DA4
	lda #$00
	tax
	sta zp06
L_0DF0: lda (zp04),y
	cmp #$F0
	bcs B_0E35
V_0DF6: sta X_6900,x
	sta zp2E
	inx
	bne B_0E0B  // Loop until X is zero
	inc V_0DF6 + 2  // screen char mem
	inc V_0E1A + 2  // screen char mem
	inc V_197A + 2
	inc V_1965 + 2
	nop
B_0E0B: iny
	cmp #$00
	beq B_0E20
//;
	cmp #$E7
	beq B_0E20
//;
	sta zp07
	lda (zp04),y
	and #$7F
//;
V_0E1A: sta X_6900,x
//;
	jsr S_0E5C  // screen char mem
//;
B_0E20: inx
	bne B_0E2F  // Loop until X is zero
	inc V_0DF6 + 2  // screen char mem
	inc V_0E1A + 2  // screen char mem
	inc V_197A + 2
	inc V_1965 + 2
B_0E2F: iny
	inc zp06
	jmp L_0DF0  // screen char mem
//;
B_0E35: cmp #$FF
	bne B_0E3C
	jmp L_11FF
//;
B_0E3C: iny
	cmp #$FB
	bne B_0E44
	jmp L_12B9
//;
B_0E44: cmp #$FE
	bne B_0E4B
	jmp L_190A
//;
B_0E4B: cmp #$FD
	bne B_0E52
	jmp L_1929
//;
B_0E52: cmp #$FC
	bne B_0E59
	jmp L_1944
//;
B_0E59: jmp L_0DF0  // screen char mem
//;
S_0E5C: lda (zp04),y
S_0E5E: sta V_7C06
	txa
	pha
	tya
	pha
	lda zp06
	pha
	lda zp07
	pha
	lda zp04
	pha
	lda zp04+1
	pha
S_0E71: lda zp06
	sta zp2D
	and #$07
	sta zp04+1
	lda zp07
	cmp #$E7
	sta zp2B
	beq B_0EBD
	lda zp06
	lsr  // div / 8
	lsr
	lsr
	and #$07
	sta zp06
	clc
	adc zp04+1
	asl  // mul * 8
	asl
	asl
	sec
	sbc zp07
	clc
	adc #$36
	sta zp04
	lda #$07
	sec
	sbc zp04+1
	clc
	adc zp06
	asl
	sta zp04+1
	nop
V_0EA4: lda zp04
	sta V_7C03
	lda zp04+1
	sta V_7C04
	lda V_7C06
	sta zp07
	and #$80
	beq B_0EBA
	jsr S_15BB
B_0EBA: jsr S_1742
B_0EBD: pla
	sta zp04+1
	pla
	sta zp04
	pla
	sta zp07
	pla
	sta zp06
	pla
	tay
	pla
	tax
B_0ECD: rts
//$0ECE  --------
S_0ECE: lda V_6570
	beq B_0ECD
	sta zp07
	lda V_7C6F
	and #$0F
	sta zp04+1
	lda V_7C6E
	and #$0F
	sta zp04
	lda V_7C70
	sta zp06
	ldx #$01
B_0EEA: lda zp07
	pha
	lda zp06
	pha
	cmp V_6570,x
	php
	inx
	plp
	bne B_0F00
	jsr S_0CC1  // screen char mem
	bne B_0F00
	jmp L_0F0E  // screen char mem
//;
B_0F00: inx
	inx
	inx
	pla
	sta zp06
	pla
	sta zp07
	dec zp07
	bne B_0EEA
	rts
//$0F0E  --------
L_0F0E: jsr S_0D6F  // screen char mem
	sta V_7C6E
	lda zp07
	sta V_7C6F
	inx
//;
	lda #$05
	jsr S_2DB3
//;
	lda V_7DF4
	sta V_7C6A
	lda V_7DF5
	sta V_7C6B
	lda V_6570,x
	sta V_7C77
	inx
	lda V_6570,x
	sta V_7C71
	lda V_7DF6
	sta V_7C6C
	lda V_7DF7
	sta V_7C6D
	lda V_7C42
	beq B_0F65
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	eor #$08
	clc
	adc V_7C6F
	sta V_7C6F
	jmp L_0F83  // screen char mem
//;
B_0F65: lda V_7C43
	beq L_0F83
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	eor #$08
	clc
	adc V_7C6E
	sta V_7C6E
L_0F83: pla
	pla
	jmp L_14B4
//;
L_0F88: pha
	lda zp02
	sta zp1F
	lda zp02+1
	sta zp1F+1
	lda #$00
	sta V_10A1 + 1
	pla
	jsr B_0FFC
	lda #$01
	sta V_10A1 + 1
B_0F9F: rts
//$0FA0  --------
S_0FA0: lda zp7A
	beq B_0F9F
	cmp #$01
	beq B_0FD5
L_0FA8: lda V_7C58
	sta zp02
	lda V_7C59
	sta zp02+1
	lda #$00
	tay
	sta zp75
	lda #$FF
	sta zp74
	lda (zp02),y
	sta zp73
	iny
	lda (zp02),y
	sta zp76
	iny
	tya
	clc
	adc zp02
	sta zp77
	lda zp02+1
	adc #$00
	sta zp77+1
	lda #$01
	sta zp7A
B_0FD5: lda zp74
	sta zp04
	beq B_101F
	cmp #$FF
	bne B_0FE6
	lda zp75
	bne B_0FE6
	jsr S_102A
B_0FE6: lda zp1F
	sta zp02
	lda zp1F+1
	sta zp02+1
	ldy #$06
	lda (zp02),y
	sta zp07
	lda zp73
	cmp zp07
	beq B_104A
L_0FFA: lda zp04
B_0FFC: sta V_7C0E
	ldy #$00
	lda #$40
	sta V_7C47
	jsr S_1A0E
	lda #$01
	sta V_7C02
	jsr S_3540
	ldy #$00
	jsr S_1A67
	ldy #$00
	iny
	jsr S_11A6
	jmp L_1094
//;
B_101F: dec zp73
	php
	lda #$FF
	plp
	bne B_0FFC
	jmp B_104A
//;
S_102A: lda zp7B
	beq B_1043
	sta zp07
	lda V_7C60
	cmp zp07
	beq B_1043
	lda V_7C4E
	beq B_1049
	lda V_7C70
	cmp zp07
	bne B_1049
B_1043: lda zp76
	sta zp04
	sta zp74
B_1049: rts
//$104A  --------
B_104A: lda zp79
	sta zp07
	lda zp75
	cmp zp07
	bne B_1057
	jmp L_0FA8  // screen char mem
//;
B_1057: ldy #$00
	inc zp75
	lda (zp77),y
	iny
	sta zp73
	lda (zp77),y
	sta zp74
	lda zp77
	clc
	adc #$02
	sta zp77
	bcc B_106F
	inc zp77+1
B_106F: jmp L_0FFA
//;
S_1072: lda #$00
	sta V_7C02
	jmp L_0A5D  // screen colour mem
//;
L_107A: lda zp02
	sta V_7C6A
	lda zp02+1
	sta V_7C6B
	jmp L_0B39  // screen colour mem
//;
L_1087: lda zp02
	sta V_7C6C
	lda zp02+1
	sta V_7C6D
	jmp L_0BC6  // screen colour mem
//;
L_1094: jsr S_10EA
	ldy #$0F
B_1099: lda (zp1F),y
	sta V_7C5A,y
	dey
	bpl B_1099
V_10A1: lda #$01
	sta V_7C02
	ldy #$0F
B_10A8: lda V_7D18,y
	sta V_7C6A,y
	dey
	bpl B_10A8
	jsr L_0A5D  // screen colour mem
	ldy #$0F
B_10B6: lda V_7C6A,y
	sta V_7D18,y
	dey
	bpl B_10B6
	lda V_7C4E
	beq B_10DD
	ldy #$0F
B_10C6: lda V_7D2C,y
	sta V_7C6A,y
	dey
	bpl B_10C6
	jsr L_0A5D  // screen colour mem
	ldy #$0F
B_10D4: lda V_7C6A,y
	sta V_7D2C,y
	dey
	bpl B_10D4
B_10DD: ldy #$0F
B_10DF: lda V_7C5A,y
	sta (zp1F),y
	dey
	bpl B_10DF
	jmp L_1101
//;
S_10EA: ldy #$0F
B_10EC: lda V_7C5A,y
	sta V_7D18,y
	dey
	bpl B_10EC
	ldy #$0F
B_10F7: lda V_7C6A,y
	sta V_7D2C,y
	dey
	bpl B_10F7
	rts
//$1101  --------
L_1101: ldy #$0F
B_1103: lda V_7D18,y
	sta V_7C5A,y
	dey
	bpl B_1103
	ldy #$0F
B_110E: lda V_7D2C,y
	sta V_7C6A,y
	dey
	bpl B_110E
B_1117: rts
//$1118  --------
S_1118: lda V_7C93
	beq B_1117
	lda #$96  // $7C96 to $04 (16bit value)
	sta zp04
	lda #$7C  // $CD7C to $05 (16bit value)
	sta zp04+1
	lda #$CD  // $63CD to $06 (16bit value)
	sta zp06
	lda #$63
	sta zp07
	lda #$8C  // $7C8C to $02 (16bit value)
	sta zp02
	lda #$7C
	sta zp02+1
	jsr S_11D5
	lda #$8C  // $7C8C to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
B_1140: lda (zp02),y
	sta (zp04),y
	dey
	bpl B_1140
//;
	lda V_7CB1
	beq B_11A5
//;
	lda #$B4  // $7CB4 to $04 (16bit value)
	sta zp04
	lda #$7C  // $E17C to $05 (16bit value)
	sta zp04+1
//;
	lda #$E1  // $63E1 to $06 (16bit value)
	sta zp06
	lda #$63
	sta zp07
//;
	lda #$AA  // $7CAA to $02 (16bit value)
	sta zp02
	lda #$7C
	sta zp02+1
//;
	jsr S_11D5
//;
	lda #$AA  // $7CAA to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
//;
B_116F: lda (zp02),y
	sta (zp04),y
	dey
	bpl B_116F
	lda V_7CD4
	beq B_11A5
	lda #$D7  // $7CD7 to $04 (16bit value)
	sta zp04
	lda #$7C  // $F57C to $05 (16bit value)
	sta zp04+1
	lda #$F5  // $63F5 to $06 (16bit value)
	sta zp06
	lda #$63
	sta zp07
	lda #$CD  // $7CCD to $02 (16bit value)
	sta zp02
	lda #$7C
	sta zp02+1
	jsr S_11D5
	lda #$CD  // $7CCD to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
B_119E: lda (zp02),y
	sta (zp04),y
	dey
	bpl B_119E
B_11A5: rts
//$11A6  --------
S_11A6: lda #$02
	sta zp07
	lda zp7C
	sta zp06
B_11AE: lda (zp1F),y
	bpl B_11C6
	eor #$FF
	clc
	adc #$01
	cmp zp06
	bcc L_11CE
	lda zp06
	eor #$FF
	adc #$00
	sta (zp1F),y
	jmp L_11CE
//;
B_11C6: cmp zp06
	bcc L_11CE
	lda zp06
	sta (zp1F),y
L_11CE: iny
	iny
	dec zp07
	bne B_11AE
	rts
//$11D5  --------
S_11D5: lda zp06
	sta V_7C58
	lda zp07
	sta V_7C59
	lda zp04
	sta zp1F
	lda zp04+1
	sta zp1F+1
	ldy #$09
B_11E9: lda (zp02),y
	sta $0073,y
	dey
	bpl B_11E9
	jsr S_0FA0  // screen char mem
	lda #$73  // $0073 to $02 (16bit value)
	sta zp02
	lda #$00
	sta zp02+1
	ldy #$08
	rts
//$11FF  --------
L_11FF: tya
	clc
	adc zp04
	sta zp02
	lda zp04+1
	adc #$00
	sta zp02+1
	lda V_7C67
	cmp #$2A
	bcc B_121E
	cmp #$5B
	bcs B_121E
	lda zp19
	sta zp02
	lda zp1A
	sta zp02+1
B_121E: ldx #$01
	ldy #$01
	lda (zp02),y
	sta V_6570
	pha
	iny
	pla
	bne B_122F
	jmp L_12D8
//;
B_122F: pha
	lda (zp02),y
	sta V_6570,x
	iny
	inx
	lda (zp02),y
	sta zp76
	sta V_6570,x
	iny
	inx
	lda (zp02),y
	sta V_6570,x
	iny
	inx
	lda (zp02),y
	sta V_6570,x
	iny
	inx
	txa
	pha
	lda zp76
	and #$03
	asl
	adc #$61
	sta V_7C06
	lda (zp02),y
	sta zp04+1
	iny
	lda (zp02),y
	sta V_7C03
	iny
	tya
	pha
	lda zp04+1
	and #$07
	sta V_7C23
	lda zp04+1
	lsr  // div / 8
	lsr
	lsr
	sta V_7C04
	lda zp02
	pha
	lda zp02+1
	pha
	jsr S_17D5
	pla
	sta zp02+1
	pla
	sta zp02
	pla
	tay
	pla
	tax
	pla
	sec
	sbc #$01
	bne B_122F
	lda V_7C67
	cmp #$5B
	bcc L_12D8
	lda zp19
	sta zp02
	lda zp1A
	sta zp02+1
	lda V_6570
	sta zp07
	ldx #$03
	ldy #$00
B_12A7: iny
	lda (zp02),y
	sta V_6570,x
	inx
	inx
	inx
	inx
	dec zp07
	bne B_12A7
	iny
	jmp L_12D8
//;
L_12B9: lda (zp04),y
	iny
	sta zp06
	asl
	tax
	bcc B_12D3
	lda #$6A
L_12C4: sta V_0DF6 + 2  // screen char mem
	sta V_0E1A + 2  // screen char mem
	sta V_197A + 2
	sta V_1965 + 2
	jmp L_0DF0  // screen char mem
//;
B_12D3: lda #$69
	jmp L_12C4
//;
L_12D8: jsr S_1ADB
	jmp L_12E9
//;
S_12DE: lda #$00
	sta zp2C
	jsr S_1AD8
	jmp L_9889
//;
//$12E8  --------
//;db $EA
//;
	.if (* < $135A) { .fill $135A-*, $FF }
	* = $135A
//$135A  --------
L_135A: lda VAR_BROTHER_INDEX
	beq B_1362
	jmp L_0965  // screen colour mem
//;
B_1362: lda V_7C60
	cmp #$03
	beq B_136C
	jmp L_0965  // screen colour mem
//;
B_136C: ldx #$00
B_136E: lda TAB_BROTHER_DIED,x
	cmp #$FF  // $FF = brother died
	beq B_13AB  // if so, no "that's all" message
	inx
	cpx #$05
	bne B_136E
//;
	lda #V_13CC & 255  // $13CC to $02 (16bit value) "THATS ALL"
	sta zp02
	lda #V_13CC >> 8
	sta zp02+1
//;
	lda #$20
L_1384: pha
	jsr S_17BD
//;
	lda #$64  // $0B64 to $04 (16bit value)
	sta zp04
	lda #$0B
	sta zp04+1
//;
	jsr S_9880
	pla
	jsr S_12EB
	jsr S_9892
	jsr S_1650
	jsr S_16AC
//;
	lda #$04
	jsr S_2DB3
//;
	jsr S_1AD8
	jmp L_2DAD
//;
B_13AB: lda #V_13B8 & 255  // $13B8 to $02 (16bit value) "JUST WHO IS THE MAN"
	sta zp02
	lda #V_13B8 >> 8
	sta zp02+1
	lda #$78
	jmp L_1384
//;
V_13B8: .byte $4A,$55,$53,$54,$20,$57,$48,$4F,$20,$49,$53,$20,$54,$48,$45,$20,$4D,$41,$4E,$3F
V_13CC: .byte $54,$48,$41,$54,$53,$20,$41,$4C,$4C,$3F
//;
S_13D6: lda #$00
	sta V_7C5C
	sta V_7C5D
	sta V_7C5F
	sta V_7C7B
	sta V_7C67
//;
	lda #$10  // $100C to $7C5A (16bit value)
	sta V_7C5B
//;
	lda #$0C
	sta V_7C5A
//;
	lda #$30
	sta V_7C5E
	sta V_7C7A
//;
	lda #$11
	sta V_7C61
	sta V_7C7C
//;
	lda #$05  // starting brother index
	sta VAR_BROTHER_INDEX
//;
	jsr S_2D89
	jsr S_17BD  // screen init
	jsr S_1AC6
	jsr L_0D96  // reveal?
	jsr S_1AD8
	jsr S_988C  // draw 5 brothers in lower/left
	jsr S_1650
	jsr S_16AC
//;
	jsr set_35D
//;lda #$07
//;sta colmap+$35D		; !!!
//;sta colmap+$385
//;sta colmap+$3AD
//;
	jmp L_2D80
//;
	nop
	nop
//;
	nop
	nop
	nop
//;
	nop
	nop
	nop
//;
S_142C: jsr S_14BF
	dey
	lda V_7C5A,y
	beq B_1442
	iny
	sta zp07
	lda V_7C5A,y
	bne B_1442
	dey
	sta V_7C5A,y
	rts
//$1442  --------
B_1442: pla
	pla
	rts
//$1445  --------
S_1445: ldy #$1E
	jsr S_142C
	sta V_7C70
	lda zp07
	cmp #$0A
	bcs B_145A
	cmp #$03
	bcc B_145A
	jmp L_2D86
//;
B_145A: lda #$05
	sec
	sbc VAR_BROTHER_INDEX
	tax
//;
	lda #$FF
	sta TAB_BROTHER_DIED,x  // flag brother as dead
//;
	dec VAR_BROTHER_INDEX  // go to next brother
//;
	jsr L_2D86
//;
//;jsr SUB_WRITE_BROTHERS_NAME	; c64 version has fix here!
	jsr disp_bro_name_fix
//;
	lda VAR_BROTHER_INDEX
	beq B_1477
	jmp L_2D83
//;
B_1477: sta V_7C77
	rts
//$147B  --------
S_147B: ldy #$0E
	jsr S_142C
	sta V_7C60
	lda zp07
	cmp #$08
	bcs B_148D
	cmp #$03
	bcs L_14B4
B_148D: lda V_7C7A
	sta V_7C5E
	lda V_7C7B
	sta V_7C5F
	lda V_7C7C
	sta V_7C61
	lda #$00
	sta V_7C5A
	sta V_7C5B
	sta V_7C5C
	sta V_7C5D
	lda #$C8
	sta zp07
	jsr S_1628
//;
L_14B4: dec zp0D+1
	ldy #$FF
	lda #$04
	sta (zp0D),y
	inc zp0D+1
B_14BE: rts
//$14BF  --------
S_14BF: lda V_7C5A,y
	bne B_14DD
	iny
	lda V_7C48
	beq B_14BE
	dey
	sta V_7C5A,y
	iny
	lda #$19
	sta V_7C5A,y
	lda #$00
	sta V_7C2E
	sta V_7C2F
	rts
//$14DD  --------
B_14DD: iny
	lda V_7C5A,y
	sec
	sbc #$01
	sta V_7C5A,y
B_14E7: rts
//$14E8  --------
S_14E8: lda V_7C77
	bne B_14E7
//;
	lda V_7C70
	cmp #$03
	bne B_14E7
//;
	jsr L_14B4
//;
	dec VAR_BROTHER_INDEX  // go to next brother
//;
	lda #$03
	jsr S_2DB3
//;
	lda #$05
	sta V_7C76
//;
//;jsr SUB_WRITE_BROTHERS_NAME	; c64 version has fix here!
	jsr disp_bro_name_fix
//;
	lda #$00
	cmp VAR_BROTHER_INDEX
	beq B_1511
//;
	jmp L_2D83
//;
B_1511: sta V_7C77
	rts
//$1515  --------
S_1515: inc V_7C4F
	lda V_7C4F
	and #$03
	asl
	sta zp07
	lda V_7C00
	clc
	adc zp07
	sec
	sbc #$18
	ldy #$02
	sta (zp0D),y
	dey
	lda #$6D
	sta (zp0D),y
	dey
	lda #$C8
	sta (zp0D),y
	ldy #$03
	lda V_7C01
	sta (zp0D),y
	iny
	lda #$00
	sta (zp0D),y
	lda V_7C4F
	cmp #$19
	bcc B_154E
	lda #$04
	sta (zp0D),y
B_154E: iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_1559
	inc zp0D+1
B_1559: inc V_6500
	rts
//$155D  --------
L_155D: cmp #$01
	php
	lda V_7C6E
	plp
	bne B_1587
	clc
	adc #$0B
L_1569: sta V_7C5E
	lda zp02+1
	pha
	lda zp02
	pha
L_1572: lda #$00
	sta V_7C5C
	sta V_7C5D
	sta V_7C5A
	sta V_7C5B
	pla
	sta zp02
	pla
	sta zp02+1
	rts
//$1587  --------
B_1587: sec
	sbc #$0B
	jmp L_1569
//;
B_158D: sec
	sbc #$0B
	jmp L_159F
//;
L_1593: cmp #$01
	php
	lda V_7C6F
	plp
	bne B_158D
	clc
	adc #$0B
L_159F: sta V_7C5F
	jmp L_1572
//;
S_15A5: lda zp02+1
	bpl B_15B5
	dec V_7C74
L_15AC: lda V_7C74
	and #$07
	sta V_7C74
	rts
//$15B5  --------
B_15B5: inc V_7C74
	jmp L_15AC
//;
S_15BB: lda zp07
	and #$7F
	sta V_7C06
	ldy #$03
	sta (zp1B),y
	iny
	lda zp04
	sta (zp1B),y
	iny
	lda zp04+1
	sta (zp1B),y
	ldy #$02
S_15D2: lda zp2D
	and #$3F
	sta zp06
	and #$07
	sta zp07
	lda zp06
	lsr  // div / 8
	lsr
	lsr
	clc
	adc zp07
	asl  // mul * 16
	asl
	asl
	asl
	sta zp07
	lda zp2B
	clc
	adc zp07
	sec
	sbc #$07
	pha
	lda #$00
	sta V_1608 + 1
	lda V_7C06
	cmp #$11
	bne B_1606
	sta V_1608 + 1
	dec V_1608 + 1
	nop
B_1606: pla
	clc
V_1608: adc #$00
V_160A: sta (zp1B),y
	dey
	lda zp04+1
	asl  // mul * 8
	asl
	asl
	sta (zp1B),y
	dey
	lda zp04
	sta (zp1B),y
	lda #$06
	clc
	adc zp1B
	sta zp1B
	bcc B_1624
	inc zp1B+1
B_1624: inc V_6590
	rts
//$1628  --------
S_1628: ldx #$08
	stx zp06
B_162C: lda zp06
	pha
	lda zp07
	pha
	jsr L_9889
	pla
	sta zp07
	pla
	sta zp06
	dec zp06
	bne B_162C
	dec zp07
	bne S_1628
	rts
//$1644  --------
S_1644: jsr S_1650
	jsr S_1AD5
	jsr S_16AC
	jmp L_1AC3
//;
S_1650: lda V_6500
	cmp #$02
	bcc B_1681
B_1657: ldx #$06
	ldy #$01
	lda #$00
	sta zp2F
	lda V_6500
	sta zp07
	dec zp07
	nop
B_1667: lda V_6500,x
	cmp V_6500,y
	bcc B_168A
	txa
	clc
	adc #$05
	tax
	tya
	adc #$05
	tay
L_1678: dec zp07
	bne B_1667
	lda zp2F
	bne B_1657
	nop
B_1681: lda #$01  // $6501 to $0D (16bit value)
	sta zp0D
	lda #$65
	sta zp0D+1
B_1689: rts
//$168A  --------
B_168A: lda #$01
	sta zp2F
	lda #$05
	sta V_7C45
	nop
B_1694: lda V_6500,y
	pha
	lda V_6500,x
	sta V_6500,y
	pla
	sta V_6500,x
	inx
	iny
	dec V_7C45
	bne B_1694
	jmp L_1678
//;
S_16AC: lda V_6500
	beq B_1689
	sta zp07
	ldy #$01
B_16B5: lda zp07
	pha
	iny
	lda V_6500,y
	sta V_7C06
	iny
	lda V_6500,y
	sta zp04
	iny
	lda V_6500,y
	sta zp04+1
	iny
	lda V_6500,y
	iny
	sta zp76
	tya
	pha
	lda zp76
	and #$3F
	beq B_1725
	cmp #$04
	beq L_16F7
	cmp #$05
	beq L_16F7
	cmp #$0A
	beq B_1701
	cmp #$03
	beq B_1725
	lda zp04
	sta V_7C03
	lda zp04+1
	sta V_7C04
	jsr S_1742
L_16F7: pla
	tay
	pla
	sta zp07
	dec zp07
	bne B_16B5
	rts
//$1701  --------
B_1701: pha
	dec zp04+1
	dec zp04+1
	dec zp04+1
	dec zp04+1
	dey
	dey
	lda zp04+1
	sta V_6500,y
	lda #$60
	sta V_173C
	jsr B_1725
	lda #$20
	sta V_173C
	pla
	jsr S_2D98
	jmp L_16F7
//;
B_1725: lda zp04+1
	and #$07
	lsr zp04+1
	lsr zp04+1
	lsr zp04+1
	sta V_7C23
	lda zp04
	sta V_7C03
	lda zp04+1
	sta V_7C04
V_173C: jsr S_17D5
	jmp L_16F7
//;
S_1742: lda V_7C06
	and #$1F
	sta zp02+1
	lda #$00
	sta zp04
	clc
	lda #$43  // "C"
	adc zp02+1
	sta zp04+1
	lda #$00
	sta zp02+1
	lda V_7C03
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	adc V_7C04
	bcc B_1772
	inc zp02+1
	clc
B_1772: adc #$00
	sta zp02
//;
	lda zp02+1
	adc #temp_gfx >> 8
	sta zp02+1
//;
	lda #$20
	sta zp06
	ldx #$00
B_1782: ldy #$00
	lda #$04
	sta zp07
B_1788: lda zp04
	ora #$80
	sta zp04
	lda (zp04,x)
	eor #$FF
	and (zp02),y
	sta zp76
	lda zp04
	and #$7F
	sta zp04
	lda (zp04,x)
	ora zp76
	sta (zp02),y
	iny
	inc zp04  // Increment 16bit value
	bne B_17A9
	inc zp04+1
B_17A9: dec zp07
	bne B_1788
	lda #$20
	clc
	adc zp02
	sta zp02
	bcc B_17B8
	inc zp02+1
B_17B8: dec zp06
	bne B_1782
	rts
//$17BD  --------

S_17BD: lda #temp_gfx >> 8
	sta V_17C8 + 2
	ldy #$18
B_17C4: ldx #$00
	lda #$FF
V_17C8:
B_17C8: sta temp_gfx,x
	dex
	bne B_17C8
	inc V_17C8 + 2
	dey
	bne B_17C4
	rts

//$17D5  --------
S_17D5: lda #$00
	sta zp02+1
	lda V_7C06
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	adc #$84
	sta zp02
	lda zp02+1
	adc #$6B
	sta zp02+1
L_17F5: ldx #$00
	jsr S_18CA
	lda V_7C23
	beq B_1802
	jsr S_1869
B_1802: lda #$00
	sta zp02+1
	lda V_7C03
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	adc V_7C04
	sta zp02
//;
	lda zp02+1
	adc #$00
	sta zp02+1
//;
	lda zp02  // $B000
	adc #$00
	sta zp02
	lda zp02+1
	adc #temp_gfx >> 8
	sta zp02+1
//;
	ldx #$00
	lda #$10  // $0310 to $06 (16bit value)
	sta zp06
B_1835: lda #$03
	sta zp07
	ldy #$00
B_183B: txa
	ora #$40
	tax
	lda V_7D18,x
	eor #$FF
	and (zp02),y
	sta zp76
	txa
	and #$BF
	tax
	lda V_7D18,x
	ora zp76
	sta (zp02),y
	iny
	inx
	dec zp07
	bne B_183B
	lda #$20
	clc
	adc zp02
	sta zp02
	bcc B_1864
	inc zp02+1
B_1864: dec zp06
	bne B_1835
	rts
//$1869  --------
S_1869: cmp #$04
	bcc B_1872
	jsr S_1894
	beq B_1893
B_1872: tay
	ldx #$00
	stx zp76
	jsr S_187E
	ldx #$40
	stx zp76
S_187E: sty zp04+1
B_1880: ldx zp76
	lda #$30
	sta zp07
	clc
B_1887: ror V_7D18,x
	inx
	dec zp07
	bne B_1887
	dec zp04+1
	bne B_1880
B_1893: rts
//$1894  --------
S_1894: pha
	ldx #$00
	jsr S_18A4
	ldx #$40
	jsr S_18A4
	pla
	sec
	sbc #$04
	rts
//$18A4  --------
S_18A4: lda #$30
	sta zp07
	lda #$00
	sta zp76
B_18AC: lda V_7D18,x
	pha
	and #$F0
	lsr  // div / 16
	lsr
	lsr
	lsr
	ora zp76
	sta V_7D18,x
	pla
	and #$0F
	asl  // mul * 16
	asl
	asl
	asl
	sta zp76
	inx
	dec zp07
	bne B_18AC
	rts
//$18CA  --------
S_18CA: ldy #$00
	jsr B_18EA
	ldx #$40
	lda V_7C06
	cmp #$69
	beq B_18E0
	cmp #$6A
	beq B_18E0
	cmp #$60
	bcs B_18EA
B_18E0: lda #$84  // $7784 to $02 (16bit value)
	sta zp02
	lda #$77
	sta zp02+1
	ldy #$00
B_18EA: lda #$10
	sta zp07
B_18EE: lda #$02
	sta V_7C45
B_18F3: lda (zp02),y
	sta V_7D18,x
	inx
	iny
	dec V_7C45
	bne B_18F3
	lda #$00
	sta V_7D18,x
	inx
	dec zp07
	bne B_18EE
	rts
//$190A  --------
L_190A: lda (zp04),y
	sta zp07
	iny
	lda (zp04),y
	sta zp30
	iny
	lda (zp04),y
	iny
B_1917: pha
	lda zp30
	jsr S_0E5E  // screen char mem
	jsr S_1963
	pla
	sec
	sbc #$01
	bne B_1917
	jmp L_0DF0  // screen char mem
//;
L_1929: lda (zp04),y
	sta zp07
	iny
	lda (zp04),y
	iny
B_1931: pha
	lda (zp04),y
	iny
	jsr S_0E5E  // screen char mem
	jsr S_1963
	pla
	sec
	sbc #$01
	bne B_1931
	jmp L_0DF0  // screen char mem
//;
L_1944: lda (zp04),y
	sta zp30
	iny
	lda (zp04),y
	iny
B_194C: pha
	lda (zp04),y
	sta zp07
	iny
	lda zp30
	jsr S_0E5E  // screen char mem
	jsr S_1963
	pla
	sec
	sbc #$01
	bne B_194C
	jmp L_0DF0  // screen char mem
//;
S_1963: lda zp2B
V_1965: sta X_6900,x
	inx
	bne B_1977  // Loop until X is zero
	inc V_0DF6 + 2  // screen char mem
	inc V_0E1A + 2  // screen char mem
	inc V_197A + 2
	inc V_1965 + 2
B_1977: lda V_7C06
V_197A: sta X_6900,x
	inx
	bne B_198C  // Loop until X is zero
	inc V_0DF6 + 2  // screen char mem
	inc V_0E1A + 2  // screen char mem
	inc V_197A + 2
	inc V_1965 + 2
B_198C: inc zp06
	rts
//$198F  --------
L_198F: sta zp2C
	jsr S_17BD
	jmp L_0D96  // screen char mem
//;
L_1997: tya
	pha
	txa
	pha
	lda zp06
	pha
	lda zp07
	pha
	lda V_0EA4  // screen char mem
	pha
	lda #$60
	sta V_0EA4  // screen char mem
	jsr S_0E71  // screen char mem
	pla
	sta V_0EA4  // screen char mem
	pla
	sta zp07
	pla
	sta zp06
	lda V_160A
	pha
	lda #$60
	sta V_160A
	jsr S_15D2
	sta zp0A
	sta V_7C02
	pla
	sta V_160A
	lda zp04
	sta zp06
	lda zp04+1
	sta zp07
	pla
	tax
	pla
	tay
	rts
//$19D9  --------
//$19D9  --------
	.byte $20,$50,$16,$4C,$AC,$16
//;
S_19DF: lda #$7F
	jsr S_33D0
	jsr S_3340
	and #$40
	bne B_1A0D
//;
	lda #$02
	sta VAR_CRUSH_VALUE
	sta V_7C69
//;
	lda #$00
	sta V_7C63
	sta V_7C62
//;
	lda #$04
	jsr S_2DB3
//;
	lda V_7C4E
	beq B_1A0D
	lda #$02
	sta V_7C78
	sta V_7C79
B_1A0D: rts
//$1A0E  --------
S_1A0E: lda (zp1F),y
	sta V_7C40
	iny
	lda (zp1F),y
	sta V_7C13
	iny
	lda (zp1F),y
	sta V_7C41
	iny
	lda (zp1F),y
	sta V_7C12
	iny
	lda (zp1F),y
	sta V_7C0B
	iny
	lda (zp1F),y
	sta V_7C0C
	iny
	iny
	lda (zp1F),y
	sta V_7C1C
	iny
	lda (zp1F),y
	sta V_7C1D
	iny
	lda (zp1F),y
	sta V_7C1B
	iny
	lda (zp1F),y
	sta V_7C24
	sta V_7C0F
	iny
	lda (zp1F),y
	sta V_7C22
	iny
	lda (zp1F),y
	sta V_7C45
	iny
	iny
	lda (zp1F),y
	sta V_7C48
	iny
	lda (zp1F),y
	sta V_7C05
	rts
//$1A67  --------
S_1A67: lda V_7C40
	sta (zp1F),y
	iny
	lda V_7C13
	sta (zp1F),y
	iny
	lda V_7C41
	sta (zp1F),y
	iny
	lda V_7C12
	sta (zp1F),y
	iny
	lda V_7C0B
	sta (zp1F),y
	iny
	lda V_7C0C
	sta (zp1F),y
	iny
	lda V_7C48
	cmp #$0A
	bcs B_1A97
	lda V_7C44
	sta (zp1F),y
B_1A97: iny
	lda V_7C1C
	sta (zp1F),y
	iny
	lda V_7C1D
	sta (zp1F),y
	iny
	lda V_7C1B
	sta (zp1F),y
	iny
	lda V_7C24
	sta (zp1F),y
	iny
	lda V_7C22
	sta (zp1F),y
	iny
	lda V_7C45
	sta (zp1F),y
	rts
//$1ABC  --------
//$1ABC  --------

//; unused?
	.byte $AD,$20,$54,$AF
//;
S_1AC0: jmp L_1B49
//;
L_1AC3: jmp L_2103
//;
S_1AC6: jmp L_21A8
//;
S_1AC9: jmp L_21E6
//;
V_1ACC: .byte $00
V_1ACD: .byte $00
V_1ACE: .byte $00
V_1ACF: .byte $00

//; unused?
	.byte $00,$00
//;
S_1AD2: jmp L_2DB0
//;
S_1AD5: jmp L_221F
//;
S_1AD8: jmp L_23AE
//;
S_1ADB: jmp L_277C
//;
S_1ADE: jmp L_1AE4
//;
//$1AE1  --------
	.byte $4C,$33,$20
//;
L_1AE4: jsr S_2CB9
	jsr S_1D25
	ldx #$00
	lda V_7E18,x
	beq B_1B1F
	sta zp0F
	inx
B_1AF4: lda V_7E18,x
	inx
	sta V_2C84
	and #$07
	beq B_1B26
	cmp #$02
	beq B_1B2C
	cmp #$04
	beq B_1B32
	cmp #$05
	beq B_1B3E
	cmp #$06
	beq B_1B38
	cmp #$07
	beq B_1B23
	cmp #$01
	beq B_1B20
	ldy #$00
	lda (zp04),y
L_1B1B: dec zp0F
	bne B_1AF4
B_1B1F: rts
//$1B20  --------
B_1B20: jsr S_2DAA
B_1B23: jmp L_1B1B
//;
B_1B26: jsr S_2569
	jmp L_1B1B
//;
B_1B2C: jsr S_25E1
	jmp L_1B1B
//;
B_1B32: jsr S_271C
	jmp L_1B1B
//;
B_1B38: jsr S_2DA7
	jmp L_1B1B
//;
B_1B3E: txa
	pha
	jsr S_2DA1
	pla
	tax
	inx
	jmp L_1B1B
//;
L_1B49: lda V_6500
	beq B_1BB6
	sta V_1C64
	lda V_7D90
	beq B_1B90
	sta zp0F
	ldy #$01
B_1B5A: tya
	pha
	iny
	iny
	lda V_7D90,y
	sta zp04
	iny
	lda V_7D90,y
	sta zp04+1
	iny
	lda V_7D90,y
	sta V_1C65
	cmp #$01
	bne B_1B7A
	asl zp04+1
	asl zp04+1
	asl zp04+1
B_1B7A: cmp #$06
	bne B_1B84
	asl zp04+1
	asl zp04+1
	asl zp04+1
B_1B84: jsr S_1BC1
	pla
	clc
	adc #$05
	tay
L_1B8C: dec zp0F
	bne B_1B5A
B_1B90: lda V_6590
	beq B_1BB6
	sta zp0F
	ldy #$01
B_1B99: lda V_6590,y
	sta zp04
	iny
	lda V_6590,y
	sta zp04+1
	iny
	tya
	pha
	lda V_6590,y
	jsr S_1C94
	pla
	clc
	adc #$04
	tay
L_1BB2: dec zp0F
	bne B_1B99
B_1BB6: rts
//$1BB7  --------
B_1BB7: lda zp07
	sec
	sbc #$08
	sta zp07
	jmp L_1BF9
//;
S_1BC1: lda V_1C64
	sta zp12
	ldx #$01
B_1BC8: inx
	inx
	lda V_6500,x
	and #$F8
	sec
	sbc #$08
	sta zp06
	inx
	lda V_6500,x
	sta zp07
	inx
	lda V_6500,x
	inx
	cmp #$02
	beq B_1C21
	cmp #$00
	beq B_1C50
	cmp #$04
	beq B_1C50
	cmp #$0A
	beq B_1BB7
	cmp #$80
	bcs B_1C50
	asl zp07
	asl zp07
	asl zp07
L_1BF9: lda #$20
	sta V_1C1D + 1
	lda #$38
	sta V_1C0E + 1
L_1C03: lda zp06
	sec
	sbc zp04
	bpl B_1C0E
	eor #$FF
	adc #$01
V_1C0E:
B_1C0E: cmp #$00
	bcs B_1C21
	lda zp07
	sec
	sbc zp04+1
	bpl B_1C1D
	eor #$FF
	adc #$01
V_1C1D:
B_1C1D: cmp #$00
	bcc B_1C26
B_1C21: dec zp12
	bne B_1BC8
	rts
//$1C26  --------
B_1C26: pla
	pla
	pla
	tax
	ldy #$00
B_1C2C: lda V_7D90,x
	sta (zp0D),y
	inx
	iny
	cpy #$04
	bne B_1C2C
	lda V_1C65
	sta (zp0D),y
	inx
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_1C48
	inc zp0D+1
B_1C48: inc V_6500
	txa
	tay
	jmp L_1B8C
//;
B_1C50: lda zp07
	and #$F8
	sec
	sbc #$08
	sta zp07
	lda #$28
	sta V_1C1D + 1
	sta V_1C0E + 1
	jmp L_1C03
//;
V_1C64: .byte $00
V_1C65: .byte $00
//;
L_1C66: ldy #$00
B_1C68: lda V_6590,x
	sta (zp0D),y
	inx
	iny
	cpy #$04
	bne B_1C68
	lda #$02
	sta (zp0D),y
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_1C82
	inc zp0D+1
B_1C82: inc V_6500
	txa
	tay
	jmp L_1BB2
//;
B_1C8A: lda zp07
	sec
	sbc #$08
	sta zp07
	jmp L_1CCC
//;
S_1C94: ldx #$01
	lda V_1C64
	sta zp12
B_1C9B: inx
	inx
	lda V_6500,x
	and #$F8
	sec
	sbc #$08
	sta zp06
	inx
	lda V_6500,x
	sta zp07
	inx
	lda V_6500,x
	inx
	cmp #$02
	beq B_1CF4
	cmp #$00
	beq B_1D00
	cmp #$04
	beq B_1D00
	cmp #$0A
	beq B_1C8A
	cmp #$80
	bcs B_1D00
	asl zp07
	asl zp07
	asl zp07
L_1CCC: lda #$20
	sta V_1CF0 + 1
	lda #$38
	sta V_1CE1 + 1
L_1CD6: lda zp06
	sec
	sbc zp04
	bpl B_1CE1
	eor #$FF
	adc #$01
V_1CE1:
B_1CE1: cmp #$00
	bcs B_1CF4
	lda zp07
	sec
	sbc zp04+1
	bpl B_1CF0
	eor #$FF
	adc #$01
V_1CF0:
B_1CF0: cmp #$00
	bcc B_1CF9
B_1CF4: dec zp12
	bne B_1C9B
	rts
//$1CF9  --------
B_1CF9: pla
	pla
	pla
	tax
	jmp L_1C66
//;
B_1D00: lda zp07
	and #$F8
	sec
	sbc #$08
	sta zp07
	lda #$28
	sta V_1CF0 + 1
	sta V_1CE1 + 1
	jmp L_1CD6
//;
S_1D14: lda #$00
	sta V_1ACC
	lda V_7C67
	cmp V_7C77
	beq B_1D24
	dec V_1ACC
B_1D24: rts
//$1D25  --------
S_1D25: lda V_6B20
	beq B_1D24
	sta zp0F
	ldx #$01
B_1D2E: lda V_6B20,x
	and #$07
	beq B_1D46
	cmp #$01
	bne B_1D3C
	jmp L_1EE2
//;
B_1D3C: dec zp0F
	bne B_1D2E
	lda #$00
	sta V_7CA9
	rts
//$1D46  --------
B_1D46: inx
	lda V_6B20,x
	sta zp02
	and #$3F
	sta V_1ACD
	lda #$00
	sta zp02+1
	lda zp02
	asl
	rol zp02+1
	sta zp02
	lda zp02+1
	adc #$69
	sta zp02+1
	ldy #$00
	lda (zp02),y
	sta zp07
	sta V_2C86
	lda zp02
	sta V_7C09
	lda zp02+1
	sta V_7C0A
	inx
	txa
	pha
	lda V_6B20,x
	sta zp06
	cmp #$78
	bcc B_1DA1
	inx
	inx
	inx
	inx
	lda zp07
	cmp V_6B20,x
	bcc B_1DBE
	inx
	lda zp06
	clc
	adc V_6B20,x
	sta zp06
	inx
	cmp V_6B20,x
	bcs L_1DCD
	lda V_6B20,x
	jmp L_1DCD
//;
B_1DA1: lda zp07
	inx
	cmp V_6B20,x
	bcs B_1DC3
	inx
	lda zp06
	clc
	adc V_6B20,x
	sta zp06
	inx
	cmp V_6B20,x
	bcc L_1DCD
	lda V_6B20,x
	jmp L_1DCD
//;
B_1DBE: dex
	dex
	jmp L_1DC7
//;
B_1DC3: inx
	inx
	inx
	inx
L_1DC7: lda zp06
	clc
	adc V_6B20,x
L_1DCD: sta zp06
	pha
	asl
	pla
	ror
	clc
	adc zp07
	sta (zp02),y
	sta zp07
	pla
	tax
	lda zp06
	sta V_6B20,x
	txa
	clc
	adc #$07
	tax
L_1DE6: lda V_6B20,x
	sta zp06
	inx
	lda V_6B20,x
	sta zp04+1
	inx
	lda V_6B20,x
	sec
	sbc zp07
	sta zp04
	lda V_2C86
	cmp zp07
	beq B_1E0D
	lda V_7C81
	and #$01
	beq B_1E0D
//;
	lda #$03
	jsr S_2DB3
//;
B_1E0D: inx
	ldy zp04+1
	lda V_6B20,x
	sta zp04+1
	sty zp02
	inx
	txa
	pha
	lda zp06
	clc
	adc zp07
	sta zp06
	ldx zp02
	ldy #$00
	lda zp06
	sta (zp0D),y
	dec zp06
	dec zp06
	iny
	txa
	sta (zp0D),y
	iny
	lda zp04
	sta (zp0D),y
	iny
	lda zp04+1
	sta (zp0D),y
	iny
	lda #$01
	sta (zp0D),y
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_1E4B
	inc zp0D+1
B_1E4B: inc V_6500
L_1E4E: lda V_7C60
	and #$3F
	cmp V_1ACD
	bne B_1E72
	lda #$05
	sta V_7C66
	sta V_7CCB
	lda #$CB  // $7CCB to $1EC4 (16bit value)
	sta V_1EC3 + 1
	lda #$7C
	sta V_1EC3 + 2
	ldx #$00
	lda V_7C61
	jsr S_1EA0
B_1E72: lda V_1ACC
	bne B_1E9B
	lda V_7C70
	and #$3F
	cmp V_1ACD
	bne B_1E9B
	lda #$05
	sta V_7C76
	sta V_7CCC
	lda #$CC  // $7CCC to $1EC4 (16bit value)
	sta V_1EC3 + 1
	lda #$7C
	sta V_1EC3 + 2
	ldx #$10
	lda V_7C71
	jsr S_1EA0
B_1E9B: pla
	tax
	jmp B_1D3C
//;
S_1EA0: sta zp04+1
	lda zp07
	sec
	sbc zp04+1
	bmi B_1EE1
	cmp #$10
	bcs B_1EE1
	pha
	asl
	pla
	ror
	sta zp04+1
	lda #$07
	sec
	sbc zp04+1
	clc
	adc #$09
	pha
	lda zp06
	asl zp04+1
	sec
	sbc zp04+1
V_1EC3: sta $FFFF  // NMI Vector Hi Byte
	pla
	cmp VAR_CRUSH_VALUE,x
	bcc B_1EE1
	adc #$00
	sta VAR_CRUSH_VALUE,x
//;
	inx
//;
	lda #$02
	jsr S_2DB3
//;
	lda VAR_CRUSH_VALUE,x
	bne B_1EE1
//;
	lda #$50
	sta VAR_CRUSH_VALUE,x
//;
B_1EE1: rts
//$1EE2  --------
L_1EE2: lda V_6B20,x
	inx
	and #$F8
	sta V_2C84
	lda V_6B20,x
	sta zp02
	and #$3F
	sta V_1ACD
	lda #$00
	sta zp02+1
	lda zp02
	asl
	rol zp02+1
	sta zp02
	lda zp02+1
	adc #$69
	sta zp02+1
	ldy #$00
	lda (zp02),y
	sta V_2C86
	sta zp07
	lda zp02
	sta V_7C09
	lda zp02+1
	sta V_7C0A
	inx
	txa
	pha
	lda V_6B20,x
	bne B_1F44
	inx
	cmp V_6B20,x
	bne B_1F92
	inx
	jsr S_2027
	beq B_1F44
	inx
	jsr S_2027
	beq B_1F92
	pla
	txa
	clc
	adc #$08
	tax
	lda V_7CA9
	beq B_1F41
	jmp L_1DE6
//;
B_1F41: jmp L_209D
//;
B_1F44: pla
	tax
	lda #$01
	sta V_6B20,x
	stx V_7C0B
	txa
	clc
	adc #$04
	pha
	tax
	lda V_6B20,x
	sta zp06
	inx
	clc
	adc V_6B20,x
	inx
	cmp V_6B20,x
	bcc B_1F67
	lda V_6B20,x
B_1F67: inx
	sta zp06
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	clc
	adc zp07
	cmp V_6B20,x
	bcc B_1FF2
	lda V_6B20,x
	ldx V_7C0B
	ldy #$00
	sty zp06
	pha
	lda zp06
	sta V_6B20,x
	pla
	jmp L_1FDE
//;
B_1F92: pla
	tax
	inx
	lda #$01
	sta V_6B20,x
	stx V_7C0B
	inx
	inx
	inx
	txa
	pha
	lda V_6B20,x
	sta zp06
	inx
	inx
	inx
	inx
	clc
	adc V_6B20,x
	inx
	cmp V_6B20,x
	bcs B_1FB8
	lda V_6B20,x
B_1FB8: inx
	sta zp06
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	clc
	adc zp07
	cmp V_6B20,x
	bcs B_1FF2
	lda V_6B20,x
	ldx V_7C0B
	pha
	lda #$00
	sta zp06
	sta V_6B20,x
	pla
L_1FDE: jsr S_1FFE
	lda V_1FFD
	php
	lda #$00
	plp
	bne B_1FF7
	lda V_7CA9
	bne B_1FF7
	jmp L_209D
//;
B_1FF2: jsr S_1FFE
	lda #$C8
B_1FF7: sta V_1FFD
	jmp L_1DE6
//;
V_1FFD: .byte $00
//;
S_1FFE: ldy V_7C09
	sty zp02
	ldy V_7C0A
	sty zp02+1
	ldy #$00
	sta (zp02),y
	sta zp07
	pla
	sta zp0A
	pla
	sta zp16
	pla
	tax
	lda zp16
	pha
	lda zp0A
	pha
	lda zp06
	sta V_6B20,x
	txa
	clc
	adc #$07
	tax
	rts
//$2027  --------
S_2027: txa
	clc
	adc #$20
	sta zp02
	lda #$00
	adc #$6B
	sta zp02+1
L_2033: lda V_2C84
	and #$08
	beq B_203D
	jsr S_2064
B_203D: lda V_2C84
	and #$10
	beq B_2047
	jsr S_206A
B_2047: lda V_2C84
	and #$20
	beq B_2051
	jsr S_2081
B_2051: bit V_2C84
	bvc B_2059
	jsr S_2087
B_2059: bit V_2C84
	bpl B_2061
	jsr S_2092
B_2061: ora #$01
B_2063: rts
//$2064  --------
S_2064: lda V_7C60
	jmp L_2072
//;
S_206A: lda V_1ACC
	bne B_2063
	lda V_7C70
L_2072: stx zp0A
	ldx #$00
	cmp (zp02,x)
	bne B_207C
	pla
	pla
B_207C: ldx zp0A
	lda #$00
	rts
//$2081  --------
S_2081: lda V_2C86
	jmp L_2072
//;
S_2087: lda V_7CB1
	beq B_2063
	lda V_7CBA
	jmp L_2072
//;
S_2092: lda V_7C93
	beq B_2063
	lda V_7C9C
	jmp L_2072
//;
L_209D: lda V_6B20,x
	sta zp06
	inx
	lda V_6B20,x
	sta zp04+1
	inx
	lda V_6B20,x
	sec
	sbc zp07
	sta zp04
	inx
	ldy zp04+1
	lda V_6B20,x
	sta zp04+1
	sty zp02
	inx
	txa
	pha
	lda zp06
	clc
	adc zp07
	sta zp06
	ldx zp02
	lda V_7D8E
	sta zp02
	lda V_7D8F
	sta zp02+1
	ldy #$00
	lda zp06
	sta (zp02),y
	dec zp06
	dec zp06
	iny
	txa
	sta (zp02),y
	iny
	lda zp04
	sta (zp02),y
	iny
	lda zp04+1
	sta (zp02),y
	iny
	lda #$06
	sta (zp02),y
	iny
	tya
	clc
	adc zp02
	sta V_7D8E
	lda #$00
	adc zp02+1
	sta V_7D8F
	inc V_7D90
	jmp L_1E4E
//;
L_2103: lda V_6500
	bne B_2109
	rts
//$2109  --------
B_2109: sta zp0F
	ldx #$01
B_210D: inx
	inx
	lda V_6500,x
	sta zp04
	inx
	lda V_6500,x
	sta zp04+1
	inx
	lda V_6500,x
	inx
	cmp #$02
	beq B_2153
	cmp #$03
	beq B_2153
	cmp #$06
	beq B_2153
	sta zp0A
	txa
	pha
	lda zp0A
	pha
	and #$7F
	beq B_215F
	cmp #$04
	beq B_215F
	cmp #$0A
	bne B_2144
	lsr zp04+1
	lsr zp04+1
	lsr zp04+1
B_2144: pla
	lda #$04
	sta zp07
	lda #$07
	sta V_2518 + 1
	jmp L_24BA
//;
L_2151: pla
	tax
B_2153: dec zp0F
	bne B_210D
	lda #$00
	sta V_6500
	jmp L_233C
//;
B_215F: lda #$05
	sta zp07
	pla
	and #$80
	beq B_216F
	lda zp04
	sec
	sbc #$08
	sta zp04
B_216F: lda zp04+1
	sec
	sbc #$08
	sta zp04+1
	and #$07
	bne B_217C
	dec zp07
B_217C: lda zp04+1
	cmp #$F0
	bcs B_219B
	cmp #$E1
	bcc B_218E
	dec zp07
	cmp #$E9
	bcc B_218E
	dec zp07
B_218E: lsr  // div / 8
	lsr
	lsr
	sta zp04+1
	lda #$05
	sta V_2518 + 1
	jmp L_24BA
//;
B_219B: dec zp07
	clc
	adc #$08
	dec zp07
	jmp B_218E
//;
//$21A5  --------
	.byte $C6,$07,$60
//;
L_21A8: lda V_67CF
	bne B_21B0
	jmp L_2C1E
//;
B_21B0: sta zp0F
	lda #$D0  // $67D0 to $08 (16bit value)
	sta zp08
	lda #$67
	sta zp08+1
B_21BA: ldy #$00
	lda (zp08),y
	iny
	sta (zp08),y
	iny
	iny
	lda (zp08),y
	beq B_21D9
	lda zp08
	clc
	adc #$12
	sta zp08
	bcc B_21D2
	inc zp08+1
B_21D2: dec zp0F
	bne B_21BA
	jmp L_2C1E
//;
B_21D9: lda zp08
	clc
	adc #$10
	sta zp08
	bcc B_21D2
	inc zp08+1
	bcs B_21D2
L_21E6: lda V_6B20
	bne B_21EE
	jmp L_2BC1
//;
B_21EE: sta zp0F
	ldx #$00
B_21F2: lda V_79B8,x
	sta zp02
	inx
	lda V_79B8,x
	sta zp02+1
	inx
	ldy #$04
	lda #$00
	sta zp04+1
	lda (zp02),y
	asl
	rol zp04+1
	sta zp04
	lda zp04+1
	adc #$69
	sta zp04+1
	ldy #$00
	lda (zp04),y
	iny
	sta (zp02),y
	dec zp0F
	bne B_21F2
	jmp L_2BC1
//;
L_221F: lda #$00
	sta V_9C80
	tay
	tax
	lda #$81  // $9C81 to $08 (16bit value)
	sta zp08
	lda #$9C
	sta zp08+1
	lda V_6500
	bne B_2234
	rts
//$2234  --------
B_2234: sta zp0F
	iny
L_2237: iny
	iny
	lda V_6500,y
	sta zp07
	iny
	lda V_6500,y
	sta zp06
	iny
	lda V_6500,y
	iny
	and #$7F
	sta zp0A
	cmp #$04
	bne B_2254
	jmp L_2334
//;
B_2254: cmp #$02
	bne B_2283
	jmp L_2334
//;
B_225B: clc
	lda zp02+1
	adc #temp_gfx >> 8
	sta zp02+1
	lda zp06
	pha
	lsr  // div / 8
	lsr
	lsr
	clc
	adc zp02
	sta zp02
	bcc B_2271
	inc zp02+1
B_2271: lda #$10  // $1002 to $06 (16bit value)
	sta zp07
	lda #$02
	sta zp06
	pla
	and #$07
	beq L_22D3
	inc zp06
	jmp L_22D3
//;
B_2283: cmp #$0A
	bne B_2295
	dec zp06
	dec zp06
	dec zp06
	dec zp06
	lsr zp06
	lsr zp06
	lsr zp06
B_2295: tya
	pha
	lda #$00
	sta zp02+1
	lda zp07
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	sta zp02
	rol zp02+1
	lda zp0A
	beq B_225B
	cmp #$03
	beq B_225B
	cmp #$04
	beq B_225B
	clc
	lda zp02+1
	adc #temp_gfx >> 8
	sta zp02+1
	lda zp02
	adc zp06
	sta zp02
	bcc B_22CB
	inc zp02+1
B_22CB: lda #$20  // $2004 to $06 (16bit value)
	sta zp07
	lda #$04
	sta zp06
L_22D3: ldy #$00
	lda zp02
	sta (zp08),y
	iny
	lda zp02+1
	sta (zp08),y
	iny
	lda zp06
	sta (zp08),y
	sta zp0A
	iny
	lda zp07
	sta (zp08),y
//;
	lda zp08
	clc
	adc #$04
	sta zp08
	sta V_2305 + 1
//;
	lda zp08+1
	adc #$00
	sta zp08+1
	sta V_2305 + 2
//;
B_22FD: ldy #$00
	lda zp0A
	sta zp06
B_2303: lda (zp02),y
V_2305: sta V_9C80,x
	iny
	inx
	dec zp06
	bne B_2303
	lda #$20
	clc
	adc zp02
	sta zp02
	bcc B_2319
	inc zp02+1
B_2319: dec zp07
	bne B_22FD
	inc V_9C80
	txa
	clc
	adc zp08
	sta zp08
	sta V_2305 + 1
	bcc B_2330
	inc zp08+1
	inc V_2305 + 2
B_2330: ldx #$00
	pla
	tay
L_2334: dec zp0F
	beq B_233B
	jmp L_2237
//;
B_233B: rts
//$233C  --------
L_233C: ldx #$00
	lda V_9C80
	beq B_23AD
	sta zp0F
	lda #$81  // $9C81 to $08 (16bit value)
	sta zp08
	lda #$9C
	sta zp08+1
B_234D: ldy #$00
	lda (zp08),y
	sta zp04
	iny
	lda (zp08),y
	sta zp04+1
	iny
	lda (zp08),y
	sta zp06
	iny
	lda (zp08),y
	sta zp07
	lda zp08
	clc
	adc #$04
	sta zp08
	sta V_237A + 1
	lda zp08+1
	adc #$00
	sta zp08+1
	sta V_237A + 2
B_2375: lda zp06
	pha
	ldy #$00
V_237A:
B_237A: lda V_9C80,x
	sta (zp04),y
	iny
	inx
	dec zp06
	bne B_237A
	lda #$20
	clc
	adc zp04
	sta zp04
	bcc B_2390
	inc zp04+1
B_2390: pla
	sta zp06
	dec zp07
	bne B_2375
	txa
	clc
	adc zp08
	sta zp08
	sta V_237A + 1
	bcc B_23A7
	inc zp08+1
	inc V_237A + 2
B_23A7: ldx #$00
	dec zp0F
	bne B_234D
B_23AD: rts
//$23AE  --------
L_23AE: lda #$00
	sta zp04
	sta zp04+1
	lda #$17  // $171F to $06 (16bit value)
	sta zp07
	lda #$1F
	sta zp06
	lda #$0C
	sta zp0F
B_23C0: jsr S_2437
	jsr S_2474
	jsr S_2461
	jsr S_24A5
	inc zp04+1
	inc zp04
	dec zp07
	dec zp07
	dec zp06
	dec zp06
	dec zp0F
	bne B_23C0
	rts
//$23DD  --------
S_23DD: lda zp04
	asl  // mul * 8
	asl
	asl
	sta zp02
	lda #$00
	sta zp02+1
	lda zp04+1
	asl  // mul * 16
	asl
	asl
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	adc zp02
	sta zp02
	bcc B_23FF
	inc zp02+1
	clc
B_23FF: lda zp04+1
	adc #bitmap >> 8
	adc zp02+1
	sta zp02+1
	lda zp04+1
	adc #temp_gfx >> 8
	sta zp04+1
	rts
//$240E  --------
S_240E: lda zp04+1
	pha
	lda zp04
	pha
	lda #$08
	sta zp12
	ldy #$00
	ldx #$00
B_241C: lda (zp04,x)  // copy characters
	sta (zp02),y
	iny
	lda zp04
	clc
	adc #$20
	sta zp04
	bcc B_242C
	inc zp04+1
B_242C: dec zp12
	bne B_241C
	pla
	sta zp04
	pla
	sta zp04+1
	rts
//$2437  --------
S_2437: lda zp04+1
	pha
	lda zp04
	pha
	lda zp06
	pha
L_2440: jsr S_23DD
B_2443: jsr S_240E
	inc zp04
	lda zp02
	clc
	adc #$08
	sta zp02
	bcc B_2453
	inc zp02+1
B_2453: dec zp06
	bne B_2443
	pla
	sta zp06
	pla
	sta zp04
	pla
	sta zp04+1
	rts
//$2461  --------
S_2461: lda zp04+1
	pha
	lda zp04
	pha
	lda zp06
	pha
	lda zp07
	clc
	adc zp04+1
	sta zp04+1
	jmp L_2440
//;
S_2474: lda zp07
	pha
	lda zp04+1
	pha
	lda zp04
	pha
L_247D: lda zp07
	pha
	lda zp04
	pha
	lda zp04+1
	pha
	jsr S_23DD
	jsr S_240E
	pla
	sta zp04+1
	pla
	sta zp04
	inc zp04+1
	pla
	sta zp07
	dec zp07
	bne L_247D
	pla
	sta zp04
	pla
	sta zp04+1
	pla
	sta zp07
	rts
//$24A5  --------
S_24A5: lda zp07
	pha
	lda zp04+1
	pha
	lda zp04
	pha
	lda zp06
	clc
	adc zp04
	sta zp04
	inc zp07
	jmp L_247D
//;
L_24BA: lsr zp04
	lsr zp04
	lsr zp04
	lda zp07
	sta V_2525 + 1
	dec zp04
	lda zp04
	cmp #$78
	bcc B_24D7
	lda #$00
	sta zp04
	dec V_2518 + 1
	jmp L_24E2
//;
B_24D7: cmp #$13
	bcc L_24E2
	lda #$18
	sbc zp04
	sta V_2518 + 1
L_24E2: lda zp04+1
	asl  // mul * 8
	asl
	asl
	sta zp02
	lda #$00
	sta zp02+1
	lda zp04
	asl  // mul * 16
	asl
	asl
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	adc zp02
	sta zp02
	bcc B_2504
	inc zp02+1
	clc
B_2504: lda zp04
	adc #bitmap >> 8  // $E000
	adc zp02+1
	sta zp02+1
	lda zp04
	adc #temp_gfx >> 8  // $B000
	sta V_252D + 2
	lda zp04+1
	sta V_252D + 1
V_2518: lda #$00  // $0008 to $06 (16bit value)
	sta zp07
B_251C: lda #$08
	sta zp06
	ldy #$00
B_2522: lda zp06
	pha
V_2525: lda #$00
	sta zp06
	ldx #$00
	sty zp0A
V_252D:
B_252D: lda temp_gfx,x
	sta (zp02),y
	inx
	tya
	clc
	adc #$08
	tay
	dec zp06
	bne B_252D
	inc zp0A
	ldy zp0A
	lda V_252D + 1
	clc
	adc #$20
	sta V_252D + 1
	bcc B_254E
	inc V_252D + 2
B_254E: pla
	sta zp06
	dec zp06
	bne B_2522
	lda #$40
	clc
	adc zp02
	sta zp02
	lda #$01
	adc zp02+1
	sta zp02+1
	dec zp07
	bne B_251C
	jmp L_2151
//;
S_2569: lda V_7E18,x
	sta zp04
	sta zp17
	inx
	lda V_7E18,x
	sta zp04+1
	sta zp17+1
	inx
	lda V_7E18,x
	inx
	clc
	adc V_7E18,x
	php
	sta V_7E18,x
	ldy #$00
	lda (zp04),y
	plp
	bpl B_258F
	jmp B_264B
//;
B_258F: lda (zp04),y
	beq B_2596
	jmp B_260B
//;
B_2596: inx
	lda V_7E18,x
	sta (zp04),y
S_259C: inx
	inc V_6500
	ldy #$00
	lda V_7E18,x
	sta (zp0D),y
	inx
	iny
	lda V_7E18,x
	pha
	cmp #$11
	bne B_25B4
	jsr S_2700
B_25B4: lda #$03
	sta zp06
B_25B8: lda V_7E18,x
	sta (zp0D),y
	inx
	iny
	dec zp06
	bne B_25B8
	pla
	sta zp06
V_25C6: lda #$01
	sta (zp0D),y
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_25D5
	inc zp0D+1
//;
B_25D5: lda #$03
	jsr S_2DB3
//;
	lda zp06
	ldy #$01
	sta (zp17),y
	rts
//$25E1  --------
S_25E1: lda V_7E18,x
	sta zp04
	sta zp17
	inx
	lda V_7E18,x
	sta zp04+1
	sta zp17+1
	jsr S_2D5C
	php
	inx
	ldy #$00
	lda (zp04),y
	plp
	beq B_264B
	lda (zp04),y
	bne B_260B
	jsr S_2D5C
	beq B_2596
B_2605: txa
	clc
	adc #$06
	tax
	rts
//$260B  --------
B_260B: inx
	inx
	inc V_7D90
	lda V_7D8E
	sta zp02
	lda V_7D8F
	sta zp02+1
	lda V_7E18,x
	ldy #$00
	sta (zp02),y
	inx
	iny
	lda V_7E18,x
	sta (zp02),y
	inx
	iny
	lda V_7E18,x
	sta (zp02),y
	inx
	iny
	lda V_7E18,x
	sta (zp02),y
	inx
	iny
	lda #$06
	sta (zp02),y
	lda V_7D8E
	clc
	adc #$05
	sta V_7D8E
	bcc B_264A
	inc V_7D8F
B_264A: rts
//$264B  --------
B_264B: lda (zp04),y
	beq B_2605
	lda #$00
	sta (zp04),y
	lda #$05
	sta V_25C6 + 1
	inx
	jsr S_259C
	lda #$01
	sta V_25C6 + 1
	rts
//$2662  --------
//$2662  --------
	.byte $BD,$18,$7E,$85,$04,$85,$17,$E8,$BD,$18,$7E,$85,$05,$85,$17,$E8
	.byte $BD,$18,$7E,$A0,$00,$91,$04,$C8,$E8,$20,$5C,$2D,$08,$E8,$28,$F0
	.byte $30,$E8,$20,$5C,$2D,$08,$E8,$28,$F0,$3B,$E8,$B1,$04,$85,$07,$20
	.byte $D9,$26,$BD,$18,$7E,$91,$04,$E8,$C8,$BD,$18,$7E,$91,$04,$E8,$C8
	.byte $A5,$04,$85,$02,$A5,$05,$85,$03,$4C,$38,$26,$20,$0C,$27,$4C,$B8
	.byte $25,$B1,$04,$DD,$18,$7E,$08,$BD,$18,$7E,$85,$07,$E8,$E8,$E8,$28
	.byte $F0,$CD,$4C,$AD,$26,$B1,$04,$DD,$18,$7E,$08,$BD,$18,$7E,$85,$07
	.byte $E8,$28,$F0,$BB,$4C,$AD,$26,$EE,$90,$7D,$AD,$8E,$7D,$85,$04,$AD
	.byte $8F,$7D,$85,$05,$A0,$00,$BD,$18,$7E,$91,$04,$E8,$C8,$A5,$07,$C9
	.byte $11,$D0,$03,$20,$00,$27,$91,$04,$C8,$A9,$02,$85,$06,$60
//;
S_2700: pha
	dey
	lda (zp04),y
	clc
	adc #$10
	sta (zp04),y
	iny
	pla
	rts
//$270C  --------
//$270C  --------
	.byte $EE,$00,$65,$A5,$0D,$85,$04,$A5,$0E,$85,$05,$A0,$00,$4C,$E6,$26
//;
S_271C: lda V_1ACC
	bne B_2755
	jsr S_2D5C
	php
	inx
	plp
	beq B_272C
	inx
	inx
	rts
//$272C  --------
B_272C: lda V_7C6C
	sta zp04
	lda V_7C6D
	sta zp04+1
	lda V_7C6E
	jsr S_2759
	sta V_7C6C
	inx
	lda V_7C6A
	sta zp04
	lda V_7C6B
	sta zp04+1
	lda V_7C6F
	jsr S_2759
	sta V_7C6A
	inx
	rts
//$2755  --------
B_2755: inx
	inx
	inx
	rts
//$2759  --------
S_2759: cmp V_7E18,x
	php
	lda zp04
	plp
	beq B_276F
	bcs B_2770
	clc
	adc #$02
	bmi B_276F
	cmp #$10
	bcc B_276F
	lda #$0F
B_276F: rts
//$2770  --------
B_2770: sec
	sbc #$02
	bpl B_277B
	cmp #$F1
	bcs B_277B
	lda #$F1
B_277B: rts
//$277C  --------
L_277C: lda #$00
	sta V_7C93
	sta V_7CB1
	sta V_7CD4
	lda #$05
	sta V_7CA2
	sta V_7CC0
	sta V_7CE3
	lda (zp02),y
	tax
	iny
	txa
	bne B_279C
	jmp L_2822
//;
B_279C: tya
	pha
	jsr S_2942
	lda #$92  // $7C92 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_295E
	lda #$9A  // $7C9A to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_297E
	lda #$CD  // $63CD to $04 (16bit value)
	sta zp04
	lda #$63
	sta zp04+1
	jsr S_2996
	pla
	tay
	lda (zp02),y
	tax
	iny
	txa
	beq L_2822
	tya
	pha
	jsr S_2942
//;
	lda #$B0  // $7CB0 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
//;
	jsr S_295E
	lda #$B8  // $7CB8 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_297E
	lda #$E1  // $63E1 to $04 (16bit value)
	sta zp04
	lda #$63
	sta zp04+1
	jsr S_2996
	pla
	tay
	lda (zp02),y
	tax
	iny
	txa
	beq L_2822
	tya
	pha
	jsr S_2942
	lda #$D3  // $7CD3 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_295E
	lda #$DB  // $7CDB to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_297E
	lda #$F5  // $63F5 to $04 (16bit value)
	sta zp04
	lda #$63
	sta zp04+1
	jsr S_2996
	pla
	tay
L_2822: jsr S_1D14
	lda #$00
	sta zp71
	sta V_6B20
	lda #$01
	sta zp21
L_2830: lda (zp02),y
	php
	iny
	plp
	bne B_2855
	lda #$00
	sta zp72
	lda #$01  // $6501 to $0D (16bit value)
	sta zp0D
	lda #$65
	sta zp0D+1
	lda #$00
	sta V_7E18
	ldx #$01
L_284A: lda (zp02),y
	php
	iny
	plp
	beq B_2854
	jmp L_29AD
//;
B_2854: rts
//$2855  --------
B_2855: tya
	pha
	lda zp02
	pha
	lda zp02+1
	pha
	lda #$01
	sta V_7CA9
	dey
	lda (zp02),y
	ldy #$00
	sta zp07
	lda #$D0  // $67D0 to $02 (16bit value)
	sta zp02
	lda #$67
	sta zp02+1
	dec zp07
	beq B_2897
B_2875: lda zp02
	clc
	adc #$03
	sta zp02
	bcc B_2880
	inc zp02+1
B_2880: lda (zp02),y
	php
	lda #$0D
	plp
	beq B_288A
	lda #$0F
B_288A: clc
	adc zp02
	sta zp02
	bcc B_2893
	inc zp02+1
B_2893: dec zp07
	bne B_2875
B_2897: ldx zp71
	lda zp02
	sta V_79B8,x
	lda zp02+1
	inx
	sta V_79B8,x
	inx
	stx zp71
	iny
	lda (zp02),y
	sta zp0A
	iny
	lda (zp02),y
	sta zp16
	iny
	iny
	lda #$00
	sta zp04+1
	lda (zp02),y
	asl
	rol zp04+1
	sta zp04
	lda zp04+1
	adc #$69
	sta zp04+1
	ldy #$00
	lda zp0A
	sta (zp04),y
	iny
	lda zp16
	sta (zp04),y
	sta V_1ACF
	ldy #$04
	lda (zp02),y
	sta zp06
	lda #$00
	sta zp07
	ldx #$00
	jsr S_0803  // screen colour mem
	lda zp0A
	sta V_1ACE,x
	inx
	inx
	lda zp06
	sta V_1ACE,x
	inx
	lda zp07
	sta V_1ACE,x
	ldy #$03
	ldx zp21
	lda (zp02),y
	beq B_2911
	sta V_6B20,x
	inx
	iny
	lda (zp02),y
	sta V_6B20,x
	inx
	iny
	lda #$00
	sta V_6B20,x
	inx
	sta V_6B20,x
	inx
B_2911: lda #$09
	sta zp06
B_2915: lda (zp02),y
	sta V_6B20,x
	inx
	iny
	dec zp06
	bne B_2915
	ldy #$00
	lda #$04
	sta zp06
B_2926: lda V_1ACE,y
	sta V_6B20,x
	inx
	iny
	dec zp06
	bne B_2926
	stx zp21
	inc V_6B20
	pla
	sta zp02+1
	pla
	sta zp02
	pla
	tay
	jmp L_2830
//;
S_2942: dex
	beq B_295D
	stx zp07
	ldx #$00
B_2949: lda V_79E0,x
	clc
	adc #$01
	asl
	sta zp04
	txa
	clc
	adc #$06
	adc zp04
	tax
	dec zp07
	bne B_2949
B_295D: rts
//$295E  --------
S_295E: lda V_79E0,x
	ldy #$00
	sta (zp04),y
	sta V_7C03
	inx
	iny
	lda #$02
	sta (zp04),y
	iny
	lda V_79E0,x
	sta (zp04),y
	inx
	iny
	lda V_79E0,x
	sta (zp04),y
	inx
	iny
	rts
//$297E  --------
S_297E: ldy #$00
	lda V_79E0,x
	sta (zp04),y
	inx
	iny
	lda V_79E0,x
	sta (zp04),y
	inx
	iny
	iny
	lda V_79E0,x
	sta (zp04),y
	inx
	rts
//$2996  --------
S_2996: lda V_7C03
	clc
	adc #$01
	asl
	sta zp06
	ldy #$00
B_29A1: lda V_79E0,x
	sta (zp04),y
	inx
	iny
	dec zp06
	bne B_29A1
	rts
//$29AD  --------
L_29AD: sta zp07
	tya
	pha
	txa
	tay
	ldx #$00
	dec zp07
	beq B_29F7
	tya
	pha
B_29BB: lda V_6659,x
	ldy #$07
	and #$07
	beq B_29EA
	cmp #$02
	beq B_29EA
	ldy #$09
	cmp #$03
	beq B_29EA
	ldy #$04
	cmp #$04
	beq B_29EA
	cmp #$07
	beq B_29EA
	ldy #$05
	cmp #$05
	beq B_29EA
	ldy #$08
	cmp #$06
	beq B_29EA
	cmp #$01
	beq B_29EA
	ldy #$00
B_29EA: sty zp0A
	clc
	txa
	adc zp0A
	tax
	dec zp07
	bne B_29BB
	pla
	tay
B_29F7: tya
	pha
	txa
	clc
	adc #$59  // "Y"
	ldy zp72
	sta V_7986,y
	lda #$00
	iny
	adc #$66
	sta V_7986,y
	iny
	sty zp72
	pla
	tay
	lda V_6659,x
	sta V_7E18,y
	inx
	and #$07
	beq B_2A6F
	cmp #$01
	bne B_2A21
	jmp L_2B5C
//;
B_2A21: cmp #$02
	beq B_2A6F
	cmp #$03
	bne B_2A2C
	jmp L_2B70
//;
B_2A2C: cmp #$04
	bne B_2A33
	jmp L_2BAD
//;
B_2A33: cmp #$05
	bne B_2A3A
	jmp L_2C87
//;
B_2A3A: cmp #$06
	bne B_2A41
	jmp L_2B5C
//;
B_2A41: cmp #$07
	beq B_2A4C
	tya
	tax
	pla
	tay
	jmp L_284A
//;
B_2A4C: lda V_6659,x
	iny
	sta V_7E18,y
	inx
	iny
	iny
	lda V_6659,x
	sta V_7E18,y
	inx
	iny
	lda V_6659,x
	sta V_7E18,y
	iny
L_2A65: inc V_7E18
	tya
	tax
	pla
	tay
	jmp L_284A
//;
B_2A6F: jsr S_2B00
	lda V_2C82
	pha
	lda zp06
	jsr S_2B17
	lda V_6659,x
	sta V_7E18,y
	inx
	iny
	lda V_6659,x
	sta V_7E18,y
	inx
	iny
	pla
	sta zp07
	sta V_7E18,y
	iny
	jsr S_0803  // screen colour mem
	lda zp0A
	sta V_7E18,y
	iny
	lda V_6659,x
	sta V_7E18,y
	sty zp0A
	ldy #$01
	sta (zp14),y
	ldy zp0A
	iny
	inx
L_2AAB: pha
	lda zp06
	sta V_7E18,y
	iny
	lda zp07
	sta V_7E18,y
	iny
	pla
	sta V_2C81
	lda V_2C83
	beq L_2A65
	tya
	pha
	tya
	tax
	ldy #$00
	lda V_7C02
	pha
	lda V_2C81
	cmp #$11
	bne B_2AD5
	clc
	adc #$10
B_2AD5: pla
	sta (zp0D),y
	iny
	lda V_2C81
	sta (zp0D),y
	iny
	lda zp06
	sta (zp0D),y
	iny
	lda zp07
	sta (zp0D),y
	iny
	lda #$01
	sta (zp0D),y
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_2AF8
	inc zp0D+1
B_2AF8: inc V_6500
	pla
	tay
	jmp L_2A65
//;
S_2B00: lda V_6659,x
	sta V_2C82
	inx
	lda V_6659,x
	sta zp07
	sta V_2C83
	inx
	lda V_6659,x
	sta zp06
	inx
	rts
//$2B17  --------
S_2B17: sta V_2C82
	lda #$00
	sta zp02+1
	txa
	pha
	lda V_2C82
	asl
	rol zp02+1
	sta zp14
	sta zp02
	lda zp02+1
	adc #$69
	sta zp14+1
	sta zp02+1
	lda V_7E18,y
	and #$07
	cmp #$03
	php
	iny
	lda zp14
	sta V_7E18,y
	iny
	lda zp14+1
	sta V_7E18,y
	iny
	plp
	bne B_2B50
	inc zp02  // Increment 16bit value
	bne B_2B50
	inc zp02+1
B_2B50: ldx #$00
	lda zp07
	sta (zp02,x)
	sta V_2C81
	pla
	tax
	rts
//$2B5C  --------
L_2B5C: lda #$07
	sta zp06
	iny
B_2B61: lda V_6659,x
	sta V_7E18,y
	inx
	iny
	dec zp06
	bne B_2B61
	jmp L_2A65
//;
L_2B70: jsr S_2B00
	lda #$14
	sta V_2C83
	lda V_6659,x
	jsr S_2B17
	lda zp06
	sta V_7E18,y
	inx
	iny
	lda #$04
	sta zp0F
B_2B89: lda V_6659,x
	sta V_7E18,y
	inx
	iny
	dec zp0F
	bne B_2B89
	lda zp06
	sta zp07
	lda V_2C82
	sta zp06
	jsr S_0803  // screen colour mem
	lda zp0A
	sta V_7E18,y
	iny
	lda V_2C81
	jmp L_2AAB
//;
L_2BAD: lda #$03
	sta zp06
	iny
B_2BB2: lda V_6659,x
	sta V_7E18,y
	inx
	iny
	dec zp06
	bne B_2BB2
	jmp L_2A65
//;
L_2BC1: lda V_7E18
	beq B_2C1D
	sta zp07
	ldy #$00
	sty zp72
B_2BCC: ldy zp72
	lda V_7986,y
	sta zp02
	iny
	lda V_7986,y
	sta zp02+1
	iny
	sty zp72
	ldy #$00
	lda (zp02),y
	and #$07
	cmp #$04
	bcs B_2C19
	cmp #$02
	bcc B_2C19
	iny
	iny
	sty zp0A
	iny
	cmp #$02
	beq B_2BF4
	iny
B_2BF4: pha
	lda #$00
	sta zp04+1
	lda (zp02),y
	asl
	rol zp04+1
	sta zp04
	lda zp04+1
	adc #$69
	sta zp04+1
	pla
	cmp #$02
	beq B_2C11
	inc zp04  // Increment 16bit value
	bne B_2C11
	inc zp04+1
B_2C11: ldy zp0A
	ldx #$00
	lda (zp04,x)
	sta (zp02),y
B_2C19: dec zp07
	bne B_2BCC
B_2C1D: rts
//$2C1E  --------
L_2C1E: lda V_6658
	beq B_2C1D
	ldy #$00
	sta zp07
B_2C27: lda V_6659,y
	and #$07
	cmp #$04
	bcs B_2C54
	cmp #$02
	bcc B_2C54
	iny
	pha
	lda V_6659,y
	iny
	sta V_6659,y
	lda #$05
	sta zp04
	pla
	cmp #$02
	beq B_2C4A
	lda #$07
	sta zp04
B_2C4A: tya
	clc
	adc zp04
	tay
	dec zp07
	bne B_2C27
	rts
//$2C54  --------
B_2C54: pha
	lda #$04
	sta zp04
	pla
	cmp #$04
	beq B_2C4A
	cmp #$07
	beq B_2C4A
	pha
	lda #$05
	sta zp04
	pla
	cmp #$05
	beq B_2C4A
	pha
	lda #$08
	sta zp04
	pla
	cmp #$06
	beq B_2C4A
	cmp #$01
	beq B_2C4A
	lda #$07
	sta zp04
	jmp B_2C4A
//;
V_2C81: .byte $00
V_2C82: .byte $00
V_2C83: .byte $00
V_2C84: .byte $FF,$00
V_2C86: .byte $00
//;
L_2C87: sta V_7E18,y
	tya
	pha
	lda V_6659,x
	ldy #$04
	sta V_640A,y
	iny
	inx
	lda V_6659,x
	sta V_640A,y
	iny
	iny
	inx
	lda V_6659,x
	sta V_640A,y
	inx
	lda V_6659,x
	sta V_6409
	pla
	tay
	jmp L_2A65
//;
V_2CB1: .byte $00
V_2CB2: .byte 6,1,3,2,1,7
//;
B_2CB8: rts
//$2CB9  --------
S_2CB9: lda V_7C81
	and #$03
	cmp #$02
	bne B_2CB8
//;
	lda V_7E16
	beq B_2CB8
//;
	dec V_7E16
	beq B_2D2A
//;
	cmp #$1E
	ldy #$00
	bcs B_2CD4
//;
	ldy #$03
B_2CD4: inc V_2CB1
	lda V_2CB1
	cmp #$03
	bcc B_2CE0
//;
	lda #$00
B_2CE0: sta V_2CB1
	clc
	tya
	adc V_2CB1
	tay
	lda V_2CB2,y
L_2CEC:
	jsr set_321
	nop
//;nop
//;nop
//;sta colmap+$321
//;sta colmap+$326
	pha
//;
	lda #(colmap+$2F8) & 255  // $CEF8 to $02 (16bit value)
	sta zp02
	lda #(colmap+$2F8) >> 8
	sta zp02+1
//;
	lda #(colmap+$2F9) >> 8  // $CEF9 to $04 (16bit value)
	sta zp04
	lda #(colmap+$2F9) >> 8
	sta zp04+1
//;
	lda #$06
	sta zp06
//;
	pla
	pha
//;
	jsr S_2D36
	jsr S_2D43
	lda #$03
	sta zp0F
	pla
//;
B_2D14: jsr S_2D30
	dec zp0F
	bne B_2D14
//;
	lda #$00
	sta VAR_CRUSH_VALUE
	sta V_7C69
	sta V_7C78
	sta V_7C79
//;
	rts
//$2D2A  --------
B_2D2A: lda colmap+1
	jmp L_2CEC
//;
S_2D30: pha
	lda #$07
	sta zp06
	pla
//;
S_2D36: ldy #$00
//;
//;sta (zp02),y
	jsr set_02
//;
B_2D3A: lda (zp02),y
//;
//;sta (zp04),y
	jsr set_04
//;
	iny
	dec zp06
	bne B_2D3A
//;
S_2D43: pha
	lda #$28
	clc
	adc zp04
	sta zp04
	bcc B_2D4F
	inc zp04+1
B_2D4F: lda #$28
	clc
	adc zp02
	sta zp02
	bcc B_2D5A
	inc zp02+1
B_2D5A: pla
	rts
//$2D5C  --------
S_2D5C: txa
	clc
	adc #$18
	sta zp02
	lda #$00
	adc #$7E
	sta zp02+1
	jmp L_2033
//;
//$2D6B  --------
	.byte $03,$4C,$ED,$BF,$A9,$2E,$20,$B7,$AF,$C8,$C0,$08,$D0,$EB,$A5,$26
	.byte $18,$69,$08,$85,$26
//;
L_2D80: jmp L_2DB9
//;
L_2D83: jmp L_2E0E
//;
L_2D86: jmp L_2E5C
//;
S_2D89: jmp L_2EA7
//;
S_2D8C: jmp L_2EBD
//;
S_2D8F: jmp L_2EDF
//;
S_2D92: jmp L_2F1F
//;
//$2D95  --------
	.byte $00,$00,$00
//;
S_2D98: jmp L_2F6D
//;
//$2D9B  --------
	.byte $4C,$00,$00,$4C,$00,$00
//;
S_2DA1: jmp L_3069
//;
S_2DA4: jmp L_30B0
//;
S_2DA7: jmp L_30CB
//;
S_2DAA: jmp L_313C
//;
L_2DAD: jmp B_329B
//;
L_2DB0: jmp L_32E9
//;
S_2DB3: jmp L_3330
//;
R_2DB6:
	jmp L_3293
//;
L_2DB9: ldx #$04
	lda #$FF
B_2DBD: sta TAB_BROTHER_DIED,x
	dex
	bpl B_2DBD
//;
	lda #$00
	sta V_2DF7 + 1
//;
	lda #$05
	sta zp0F
//;
B_2DCC: inc V_2DF7 + 1
B_2DCF: lda V_42ED
	sta zp02+1
	bne B_2DD8
	inc zp02+1
B_2DD8: lda V_42EC
	eor zp02+1
	pha
	lsr
	pla
	ror
	sta zp02
	clc
	adc zp02+1
	sta zp02+1
	lda zp02
	sta V_42EC
	and #$07
	pha
	lda zp02+1
	sta V_42ED
	ldx #$00
V_2DF7: lda #$00
	sta zp07
	pla
B_2DFC: cmp TAB_BROTHER_DIED,x
	beq B_2DCF
	inx
	dec zp07
	bne B_2DFC
	dex
	sta TAB_BROTHER_DIED,x
	dec zp0F
	bne B_2DCC
//;
L_2E0E: lda #$05
	sec
	sbc VAR_BROTHER_INDEX
//;
	tax
	lda TAB_BROTHER_DIED,x
	asl  // mul * 4
	asl
	tay
	lda V_6B00,y
	ldx #$00
	sta V_7C49,x
	sta V_7C6E
	inx
	iny
	lda V_6B00,y
	sta V_7C49,x
	inx
	sta V_7C6F
	iny
	lda V_6B00,y
	sta V_7C49,x
	sta V_7C71
	inx
	iny
	lda V_6B00,y
	sta V_7C49,x
	sta V_7C77
//;
	lda #$00
	sta V_7C6A
	sta V_7C6B
	sta V_7C6C
	sta V_7C6D
	sta V_7C70
	sta V_7C4F
//;
	rts
//$2E5C  --------
L_2E5C: lda V_7C76
	beq B_2E6C
	ldy #$FF
	dec zp0D+1
	lda #$04
	sta (zp0D),y
	inc zp0D+1
	rts
//$2E6C  --------
B_2E6C: lda V_7D8E
	sec
	sbc #$05
	sta zp02
	sta V_7D8E
	lda V_7D8F
	sbc #$00
	sta zp02+1
	sta V_7D8F
	ldy #$04
	tya
	sta (zp02),y
	ldy #$00
	lda #$05
	sta zp07
B_2E8C: lda (zp02),y
	sta (zp0D),y
	iny
	dec zp07
	bne B_2E8C
	lda zp0D
	clc
	adc #$05
	sta zp0D
	bcc B_2EA0
	inc zp0D+1
B_2EA0: inc V_6500
	dec V_7D90
	rts
//$2EA7  --------
L_2EA7: ldx #$00
	lda V_67B6,x
	beq B_2EBC
	sta zp07
	txa
	inx
B_2EB2: sta V_67B6,x
	inx
	inx
	inx
	dec zp07
	bne B_2EB2
B_2EBC: rts
//$2EBD  --------
L_2EBD: lda #$00
	sta V_67CE
	tay
	lda V_67B6,y
	beq B_2EDA
	iny
	sta zp07
	lda V_7C67
B_2ECE: iny
	cmp V_67B6,y
	beq B_2EDB
	iny
	iny
	dec zp07
	bne B_2ECE
B_2EDA: rts
//$2EDB  --------
B_2EDB: sta V_67CE
	rts
//$2EDF  --------
L_2EDF: lda V_67CE
	beq B_2F05
	ldy #$00
	lda V_67B6,y
	sta zp07
	iny
B_2EEC: iny
	lda V_7C67
	cmp V_67B6,y
	php
	iny
	plp
	bne L_2F00
	lda V_7C60
	cmp V_67B6,y
	beq B_2F0B
L_2F00: iny
	dec zp07
	bne B_2EEC
B_2F05: rts
//$2F06  --------
B_2F06: iny
	iny
	jmp L_2F00
//;
B_2F0B: dey
	dey
	lda V_67B6,y
	bne B_2F06
	lda #$78
	sta V_67B6,y
	sta V_7E16
	lda #$04
	jmp L_3330
//;
L_2F1F: lda zp04+1
	clc
	adc zp04
	sta zp04
	lda zp02+1
	clc
	adc zp02
	sec
	sbc zp04
	bpl B_2F34
	eor #$FF
	adc #$01
B_2F34: cmp #$05
	bcc B_2F68
	pha
	sta zp04
	lda #$06
	jsr L_3330
	pla
	cmp #$11
	bcc B_2F68
	sta zp04
	lda V_7C02
	cmp #$01
	beq B_2F5E
	lda zp04
	cmp #$19
	bcc B_2F68
//;
	lda #$03
	sta VAR_CRUSH_VALUE
	lda #$28
	sta V_7C69
//;
B_2F5E: lda #$03  // $2803 to $7C78 (16bit value)
	sta V_7C78
	lda #$28
	sta V_7C79
B_2F68: rts
//$2F69  --------
V_2F69: .byte $00
V_2F6A: .byte $00
V_2F6B: .byte $00
V_2F6C: .byte $00
//;
L_2F6D: lda zp04
	sta V_2F69
	lda zp04+1
	sta V_2F6A
	lda V_7C06
	pha
	ldy #$FF
	sty V_7C06
	ldy #$00
	sty zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	sta zp06
	ldy zp02+1
	sty zp07
	asl
	rol zp02+1
	adc zp06
	sta zp02
	lda zp02+1
	adc zp07
	sta zp02+1
	lda zp02
	asl
	sta zp02
	rol zp02+1
	pla
	sec
	sbc #$0A
	cmp #$04
	bcc B_2FBC
	lda #$80  // $C980 to $02 (16bit value)
	sta zp02
	lda #$C9
	sta zp02+1
	lda #$02
	pha
	bne B_2FD2
B_2FBC: asl zp02
	rol zp02+1
	pha
	asl
	pla
	ror
	pha
	lda zp02
	clc
	adc #$40
	sta zp02
	lda zp02+1
	adc #$C4
	sta zp02+1
B_2FD2: lda #$10  // $0410 to $04 (16bit value)
	sta zp04
	lda #$04
	sta zp04+1
	pla
	clc
	adc V_7C03
	sta V_7C03
	lda #$40  // $1040 to $06 (16bit value)
	sta zp06
	lda #$10
	sta zp07
	lda #$03
	jsr S_300E
	lda V_2F6B
	sta zp02
	lda V_2F6C
	sta zp02+1
	jsr S_0818  // screen colour mem
	lda #$10  // $0310 to $04 (16bit value)
	sta zp04
	lda #$03  // $3003 to $05 (16bit value)
V_3002: sta zp04+1
	lda #$30  // $1030 to $06 (16bit value)
	sta zp06
	lda #$10
	sta zp07
	lda #$02
S_300E: pha
	lda zp02
	sta V_2F6B
	lda zp02+1
	sta V_2F6C
	lda V_080C  // screen colour mem
	sta zp02
	lda V_080D  // screen colour mem
	sta zp02+1
	ldy #$00
	lda zp04
	sta (zp02),y
	ldy #$04
	lda zp04+1
	sta (zp02),y
	lda V_080E  // screen colour mem
	sta zp02
	lda V_080F  // screen colour mem
	sta zp02+1
	ldy #$00
	pla
	sta (zp02),y
	lda V_0810  // screen colour mem
	sta zp02
	lda V_0811  // screen colour mem
	sta zp02+1
	lda zp06
	sta (zp02),y
	lda V_0812  // screen colour mem
	sta zp02
	lda V_0813  // screen colour mem
	sta zp02+1
	lda zp06
	sta (zp02),y
	lda V_0814  // screen colour mem
	sta zp02
	lda V_0815  // screen colour mem
	sta zp02+1
	lda zp07
	sta (zp02),y
	rts
//$3069  --------
L_3069: lda #$00
	sta zp07
	lda V_7C5E
	sec
	sbc V_640E
	beq B_3082
	bmi B_307E
	lda #$04
	sta zp07
	bne B_3082
B_307E: lda #$02
	sta zp07
B_3082: lda V_7C5F
	sec
	sbc V_640F
	php
	lda zp07
	plp
	beq B_3099
	bpl B_3096
	clc
	adc #$08
	bne B_3099
B_3096: clc
	adc #$01
B_3099: eor #$FF
	sta zp07
	lda V_6409
	sta V_7C8B
	lda #$0A  // $640A to $02 (16bit value)
	sta zp02
	lda #$64
	sta zp02+1
	lda zp07
	jmp L_0821  // screen colour mem
//;
L_30B0: ldy #$00
	lda (zp04),y
	iny
	pha
	lda #$40
	sta zp07
	ldx #$00
B_30BC: lda #$E7
	sta X_6900,x
	inx
	inx
	dec zp07
	bne B_30BC
	pla
	rts
//$30C9  --------
V_30C9: .byte $00
V_30CA: .byte $00
//;
L_30CB: lda #$00
	sta V_30C9
L_30D0: txa
	pha
	lda V_7E18,x
	sta V_30CA
	inx
	lda #$5A  // $7C5A to $0B (16bit value)
	sta zp0B
	lda #$7C
	sta zp0B+1
	jsr S_316F
	lda V_7C93
	beq B_30F4
	lda #$96  // $7C96 to $0B (16bit value)
	sta zp0B
	lda #$7C
	sta zp0B+1
	jsr S_316F
B_30F4: inx
	inx
	lda V_30C9
	bne B_3142
	txa
	pha
	lda #$60  // $7C60 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_3258
	lda V_7C4E
	beq B_311B
	pla
	pha
	tax
	lda #$70  // $7C70 to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
	jsr S_3258
B_311B: lda V_7C93
	beq B_312E
	pla
	pha
	tax
	lda #$9C  // $7C9C to $04 (16bit value)
	sta zp04
	lda #$7C
	sta zp04+1
L_312B: jsr S_3258
B_312E: pla
	clc
	adc #$04
	tax
	pla
	tay
	lda V_30CA
	sta V_7E18,y
B_313B: rts
//$313C  --------
L_313C: sta V_30C9
	jmp L_30D0
//;
B_3142: txa
	pha
	clc
	adc #$18
	sta zp04
	lda #$00
	adc #$7E
	sta zp04+1
	lda V_7E18,x
	inx
	inx
	clc
	adc V_7E18,x
	sta V_7E18,x
	bpl B_3169
	txa
	clc
	adc #$18
	sta zp04
	lda #$00
	adc #$7E
	sta zp04+1
B_3169: pla
	tax
	pha
	jmp L_312B
//;
S_316F: ldy #$04
	lda (zp0B),y
	sec
	sbc V_7E18,x
	sta zp04
	bpl B_317F
	eor #$FF
	adc #$01
B_317F: cmp #$0F
	bcs B_313B
	sta zp06
	iny
	lda (zp0B),y
	inx
	sec
	sbc V_7E18,x
	sta zp04+1
	bpl B_3195
	eor #$FF
	adc #$01
B_3195: dex
	cmp #$0F
	bcs B_313B
	sta zp07
	lda V_30CA
	ldy #$07
	cmp (zp0B),y
	bcc L_31E9
	lda zp07
	cmp #$08
	bcc B_31AE
	jmp L_3247
//;
B_31AE: lda zp06
	cmp #$08
	bcc B_31B7
	jmp L_3247
//;
B_31B7: iny
	lda (zp0B),y
	sec
	sbc #$02
	bpl B_31E3
	cmp #$FC
	bcc B_31C5
	lda #$FC
B_31C5: sta (zp0B),y
	iny
	lda (zp0B),y
	bne L_31E9
	ldy #$07
	lda (zp0B),y
	clc
	adc #$02
	sta (zp0B),y
	iny
	lda #$FE
	sta (zp0B),y
	ldy #$0C
	lda #$04
	sta (zp0B),y
	jmp L_31E9
//;
B_31E3: sec
	sbc #$05
	jmp B_31C5
//;
L_31E9: ldy #$09
	lda (zp0B),y
	beq B_3230
	iny
	lda (zp0B),y
	sta zp07
	ldy #$08
	lda (zp0B),y
	bmi B_31FE
	eor #$FF
	adc #$00
B_31FE: pha
	and #$80
	sta zp0A
	pla
	ror
	and #$7F
	ora zp0A
	clc
	adc zp07
	clc
	adc zp07
	and #$07
	ldy #$0A
	sta (zp0B),y
	lda #$78
	ldy #$07
	lda #$07
	jsr L_3330
	lda zp04
	jsr S_3231
	lda zp04+1
	bmi B_323F
B_3227: ldy #$00
B_3229: lda (zp0B),y
	sec
	sbc #$02
	sta (zp0B),y
B_3230: rts
//$3231  --------
S_3231: cmp #$00
	bpl B_3243
L_3235: ldy #$02
B_3237: lda (zp0B),y
	clc
	adc #$02
	sta (zp0B),y
	rts
//$323F  --------
B_323F: ldy #$00
	beq B_3237
B_3243: ldy #$02
	bne B_3229
L_3247: lda zp04+1
	jsr S_3253
	lda zp04
	bmi B_3243
	jmp L_3235
//;
S_3253: bmi B_3227
	jmp B_323F
//;
S_3258: ldy #$00
	lda (zp04),y
	cmp V_7E18,x
	php
	inx
	lda V_30CA
	plp
	bne B_3272
	clc
	adc #$01
	cmp V_7E18,x
	bcc B_3272
	lda V_7E18,x
B_3272: sta V_30CA
	inx
	lda (zp04),y
	cmp V_7E18,x
	bne B_3292
	inx
	lda V_30CA
	sec
	sbc #$01
	cmp V_7E18,x
	sta V_30CA
	bcs B_3292
	lda V_7E18,x
	sta V_30CA
B_3292: rts
//$3293  --------
//$3293  --------
L_3293:
	pha
	lda #$01
	sta V_7E17
	pla
	rti
//;
B_329B: lda #$00
	jsr S_33D0
	jsr S_3340
	cmp #$FF
	bne B_329B
	lda #$00
	sta V_6570
	sta V_6500
	sta V_7E18
	tay
B_32B3: sta V_7C00,y
	sta V_7D00,y
	dey
	bne B_32B3
	ldy #$19
B_32BE: sta V_7E00,y
	dey
	bpl B_32BE
	lda #$01  // $6501 to $0D (16bit value)
	sta zp0D
	lda #$65
	sta zp0D+1
	lda #$49  // "I"
	sta V_7C7E
	sta V_7C7F
	sta V_7C80
	sta V_7C81
B_32DA: lda #$00
	jsr S_33D0
	jsr S_3340
	cmp #$FF
	beq B_32DA
	jmp L_0827  // screen colour mem
//;
L_32E9: lda #$81
	jsr S_33D0
	jsr S_3340
	sta zp0A
	rol
	ror V_7C0E
	rol
	ror V_7C0E
	rol
	ror V_7C0E
	rol
	ror V_7C0E
	lsr V_7C0E
	lsr V_7C0E
	lsr V_7C0E
	lsr V_7C0E
	lda zp0A
	and V_7C0E
	sta V_7C0E
	lda #$FF
	jsr S_33D0
	jsr S_3340
	sta zp0A
	lsr  // div / 16
	lsr
	lsr
	lsr
	rol zp0A
	lda zp0A
	and V_7C0E
	sta V_7C0E
	rts
//$3330  --------
L_3330: rts
//$3331  --------
//$3331  --------
	.byte $A9,$00,$20,$90,$FF,$A9,$01,$AA,$A8,$20,$BA,$FF,$A9,$08,$A2
//;
S_3340: stx zpD0
	sty zpD1
	lda $FF08  // Keyboard Latch
	ldx #$07
B_3349: cmp V_3360,x
	beq B_3354
	dex
	bpl B_3349
	ldx zpD0
	rts
//$3354  --------
B_3354: lda V_3368,x
	ldx zpD0
	rts
//$335A  --------
//$335A  --------
	.byte $33,$20,$BD,$FF,$A9,$00
V_3360: .byte $FE,$F6,$F7,$F5,$FD,$F9,$FB,$FA
V_3368: .byte $FD,$FD,$FE,$FA,$FB,$FB,$F7,$F5,$BA,$FF,$A9,$06,$A2,$A2,$A0,$33
	.byte $20,$BD,$FF,$A9,$00,$20,$D5,$FF,$A9,$10,$0D,$06,$FF,$8D,$06,$FF
	.byte $AD,$07,$FF,$29,$9F,$8D,$07,$FF,$4C,$00,$69,$53,$54,$41,$52,$54
	.byte $53,$43,$52,$42,$4F,$42,$36,$2E,$31,$41,$42,$4F,$42,$36,$2E,$32
.byte $09,$0C,$00,$00,$21,$96,$00,$00,$06,$0C,$00,$00,$21,$96,$00,$00
.byte $08,$03,$00,$00,$21,$05,$00,$00,$07,$03,$00,$00,$21,$05,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
//;
S_33D0: sta $FD30  // Keyboard Matrix
	sta $FF08  // Keyboard Latch
	rts
//$33D7  --------
//$33D7  --------
	.byte $00,$00,$00,$A9,$01,$8D,$55,$C6,$8D,$52,$C6,$A0,$00,$B1,$24,$85
	.byte $26,$C8,$B1,$24,$85,$27,$88,$20,$F1,$C6,$A5,$27,$F0,$51,$A0,$00
	.byte $B1,$26,$F0,$2C,$C9,$02,$D0,$0F,$C8
V_3400: .byte $B1,$26,$48,$C8,$B1,$26,$85,$27,$68,$85,$26,$4C,$71,$C6,$A5,$24
	.byte $48,$A5,$25,$48,$A5,$26,$18,$69,$01,$85,$24,$A5,$27,$69,$00,$85
	.byte $25,$EE,$55,$C6,$4C,$5E,$C6,$18,$A5,$26,$69,$01,$8D,$B8,$C6,$A5
	.byte $27,$69,$00,$8D,$B9,$C6,$A9,$00,$8D,$3F,$C6,$20,$00,$00,$2C,$3F
	.byte $C6,$30,$1E,$4C,$5E,$C6,$A5,$26,$F0,$17,$A0,$01,$B1,$24,$48,$88
	.byte $B1,$24,$48,$20,$F1,$C6,$68,$20,$82,$CE,$68,$20,$82,$CE,$4C,$5E
	.byte $C6,$CE,$55,$C6,$F0,$09,$68,$85,$25,$68,$85,$24,$4C,$5E,$C6,$A9
	.byte $00,$8D,$52,$C6,$60,$A5,$24,$18,$69,$02,$85,$24,$A5,$25,$69,$00
	.byte $85,$25,$60,$AE,$3F,$B2,$A0,$00,$B1,$26,$8D,$3D,$C6,$C8,$B1,$26
	.byte $8D,$3E,$C6,$D0,$02,$38,$60,$C8,$B1,$26,$29,$7F,$DD,$40,$B2,$D0
	.byte $04,$E8,$4C,$13,$C7,$C9,$0A,$90,$0D,$AD,$3D,$C6,$85,$26,$AD,$3E
	.byte $C6,$85,$27,$4C,$FF,$C6,$BD,$40,$B2,$20,$46,$A1,$D0,$EB,$8E,$3F
	.byte $B2,$98,$18,$65,$26,$85,$26,$A5,$27,$69,$00,$85,$27,$18,$60,$00
	.byte $00,$00,$00,$00,$48,$98,$48,$A5,$26,$48,$A5,$27,$48,$A9,$00,$8D
	.byte $4D,$C7,$AD,$4B,$C7,$29,$01,$F0,$0D,$20,$B9,$C7,$68,$85,$27,$68
	.byte $85,$26,$68,$A8,$68,$60,$AD,$4C,$C7,$C9,$05,$D0,$08,$A9,$24,$20
V_3500: .byte $21,$C8,$4C,$8B,$C7,$A9,$24,$20,$B7,$AF,$A9,$30,$20,$21,$C8,$A5
	.byte $27,$20,$9B,$C7,$A5,$26,$20,$9B,$C7,$20,$2B,$C8,$4C,$68,$C7,$48
	.byte $4A,$4A,$4A,$4A,$20,$A8,$C7,$68,$20,$A8,$C7,$60,$29,$0F,$C9,$0A
	.byte $90,$03,$18,$69,$07,$69,$30,$20,$21,$C8,$60,$00,$00,$A9,$2F,$8D
//;
S_3540: lda V_7C02
	beq B_354C
	cmp #$01
	beq L_355C
	jmp L_414D
//;
B_354C: jsr S_1AD2
	jsr S_3772
	jsr S_3F59
L_3555: jsr S_3730
	jmp S_3562
//;
B_355B: rts
//$355C  --------
L_355C: jsr S_3772
	jmp L_3555
//;
S_3562: lda V_7C00
	cmp #$B4
	bcs B_355B
	lda V_4277
	and #$40
	bne B_3575
	lda V_7C45
	beq B_35E4
B_3575: lda zp0D
	sta zp02
	lda zp0D+1
	sta zp02+1
	lda V_7C47
	cmp #$40
	bne B_35A6
	lda V_7C43
	clc
	adc V_7C42
	bpl B_3592
	eor #$FF
	clc
	adc #$01
B_3592: sta zp06
	beq B_35A6
	cmp #$04
	bcs B_35A1
	lda V_7C81
	and #$01
	beq B_35A6
//;
B_35A1: lda #$01
	jsr S_2DB3
//;
B_35A6: jsr S_3607
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_35B3
	inc zp0D+1
B_35B3: lda V_4277
	and #$40
	beq B_35C0
	dey
	lda #$04
	sta (zp02),y
	iny
B_35C0: lda V_7C48
	cmp #$0A
	bcc B_35CD
	dey
	lda #$0A
	sta (zp02),y
	iny
B_35CD: lda V_398C
	cmp #$06
	bcc B_35E0
	cmp #$00
	bmi B_35E0
	dey
	lda (zp02),y
	clc
	adc #$80
	sta (zp02),y
B_35E0: inc V_6500
	rts
//$35E4  --------
B_35E4: lda V_7D8E
	sta zp02
	lda V_7D8F
	sta zp02+1
	jsr S_3607
	tya
	clc
	adc V_7D8E
	sta V_7D8E
	bcc B_35FE
	inc V_7D8F
B_35FE: inc V_7D90
	dey
	lda #$03
	sta (zp02),y
	rts
//$3607  --------
S_3607: ldy #$00
	lda V_7C0C
	clc
	adc V_7C0B
	sta zp04
	lda V_7C1C
	clc
	adc zp04
	sta (zp02),y
	lda V_7C48
	cmp #$0A
	bcc B_362A
	lda V_7CCA
	cmp #$05
	beq B_362A
	sta (zp02),y
B_362A: iny
	lda V_7C0F
	sta zp07
	lda V_7C22
	clc
	adc zp07
	adc V_7C47
	sta (zp02),y
	iny
	lda V_7C00
	sta (zp02),y
	iny
	lda V_7C01
	sta (zp02),y
	iny
	lda #$00
	sta (zp02),y
	iny
	rts
//$364E  --------
S_364E: lda V_7C0C
	lsr  // div / 16
	lsr
	lsr
	lsr
	sta V_7C0A
	sta zp04+1
	lda V_7C0B
	lsr  // div / 16
	lsr
	lsr
	lsr
	sta V_7C09
	sta zp04
	lda V_7C0C
	and #$F0
	lsr
	clc
	adc zp04
	sta V_7C0D
	ldx #$05
	lda #$00
B_3676: sta V_7C14,x
	dex
	bpl B_3676
	lda V_7C0B
	and #$0F
	cmp #$09
	bcc B_36AA
	ldy #$01
	sty V_7C18
	sty V_7C14
	cmp #$0F
	bcs L_36CD
	pha
	lda V_7C18
	ora #$02
	sta V_7C18
	pla
	cmp #$0B
	bcs L_36CD
	lda V_7C18
	ora #$04
	sta V_7C18
	jmp L_36CD
//;
B_36AA: cmp #$02
	bcc B_36B3
	ldy #$01
	sty V_7C16
B_36B3: cmp #$03
	bcc B_36C1
	pha
	lda V_7C16
	ora #$02
	sta V_7C16
	pla
B_36C1: cmp #$06
	bcc L_36CD
	lda V_7C16
	ora #$04
	sta V_7C16
L_36CD: lda V_7C0C
	and #$0F
	cmp #$09
	bcc B_36FD
	ldy #$01
	sty V_7C19
	ldy #$08
	sty V_7C15
	cmp #$0F
	bcs L_3720
	pha
	lda V_7C19
	ora #$02
	sta V_7C19
	pla
	cmp #$0B
	bcs L_3720
	lda V_7C19
	ora #$04
	sta V_7C19
	jmp L_3720
//;
B_36FD: cmp #$02
	bcc B_3706
	ldy #$01
	sty V_7C17
B_3706: cmp #$03
	bcc B_3714
	pha
	lda V_7C17
	ora #$02
	sta V_7C17
	pla
B_3714: cmp #$06
	bcc L_3720
	lda V_7C17
	ora #$04
	sta V_7C17
L_3720: lda V_7C0D
	clc
	adc V_7C14
	adc V_7C15
	adc #$C0
	sta V_7C10
	rts
//$3730  --------
S_3730: lda V_7C0C
	sec
	sbc V_7C0B
	sta zp04+1
	lda V_7C22
	beq B_375F
	cmp #$10
	beq B_375F
	lda V_7C0C
	clc
	adc V_7C0B
	lsr
L_374A: sta zp04
	sec
	sbc V_7C1C
	clc
	adc #$3F
	sta V_7C00
	lda #$79
	clc
	adc zp04+1
	sta V_7C01
	rts
//$375F  --------
B_375F: lda V_7C0C
	lsr
	lsr V_7C0B
	php
	clc
	adc V_7C0B
	plp
	rol V_7C0B
	jmp L_374A
//;
S_3772: lda #$00
	cmp V_7C12
	bne B_37B3
	cmp V_7C13
	bne B_37B3
	cmp V_7C40
	bne B_37B3
	cmp V_7C41
	bne B_37B3
	lda V_7C1B
	bne B_37B3
	lda V_7C0E
	and #$0F
	cmp #$0F
	bne B_37B3
	lda V_7C45
	beq B_379E
	dec V_7C45
B_379E: jsr S_37BA
	jsr S_364E
	jsr S_3B2D
	jsr S_3929
	jsr S_409D
	jsr S_41C8
	jmp L_39B4
//;
B_37B3: lda #$05
	sta V_7C45
	bne B_379E
S_37BA: lda V_7C1B
	beq B_37C2
	jmp L_386F
//;
B_37C2: lda V_7C0E
	eor #$FF
	sta zp07
	and #$09
	bne B_37E4
	lda V_7C13
	cmp #$64
	bcs B_37DE
	cmp #$00
	beq L_381B
	dec V_7C13
	jmp L_381B
//;
B_37DE: inc V_7C13
	jmp L_381B
//;
B_37E4: cmp #$09
	beq L_381B
	cmp #$08
	bne B_3805
	dec V_7C13
	dec V_7C13
	lda V_7C13
	cmp #$EF
	bcs L_381B
	cmp #$78
	bcc L_381B
	lda #$F0
	sta V_7C13
	jmp L_381B
//;
B_3805: lda V_7C13
	clc
	adc #$02
	sta V_7C13
	cmp #$11
	bcc L_381B
	cmp #$78
	bcs L_381B
	lda #$10
	sta V_7C13
L_381B: lda zp07
	and #$06
	bne B_3838
	lda V_7C12
	cmp #$64
	bcs B_3832
	cmp #$00
	beq L_386F
	dec V_7C12
	jmp L_386F
//;
B_3832: inc V_7C12
	jmp L_386F
//;
B_3838: cmp #$06
	beq L_386F
	cmp #$02
	bne B_3859
	lda V_7C12
	sec
	sbc #$02
	sta V_7C12
	cmp #$EF
	bcs L_386F
	cmp #$78
	bcc L_386F
	lda #$F0
	sta V_7C12
	jmp L_386F
//;
B_3859: lda V_7C12
	clc
	adc #$02
	sta V_7C12
	cmp #$11
	bcc L_386F
	cmp #$78
	bcs L_386F
	lda #$10
	sta V_7C12
L_386F: lda V_7C12
	clc
	adc V_7C41
	cmp #$78
	bcc B_388E
	eor #$FF
	adc #$00
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	eor #$FF
	clc
	adc #$01
	jmp L_3896
//;
B_388E: pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
L_3896: sta V_7C43
	clc
	adc V_7C0B
	sta V_7C0B
	cmp #$DC
	bcc B_38B2
	lda #$00
	sta V_7C12
	sta V_7C41
	inc V_7C24
	jmp L_38C3
//;
B_38B2: cmp #$72
	bcc L_38C3
	lda #$00
	sta V_7C12
	sta V_7C41
	lda #$71
	dec V_7C24
L_38C3: sta V_7C0B
	lda V_7C13
	clc
	adc V_7C40
	cmp #$78
	bcc B_38E5
	eor #$FF
	adc #$00
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	eor #$FF
	clc
	adc #$01
	jmp L_38ED
//;
B_38E5: pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
L_38ED: sta V_7C42
	clc
	adc V_7C0C
	cmp #$DC
	bcc B_3906
	lda #$00
	sta V_7C13
	sta V_7C40
	inc V_7C24
	jmp L_3917
//;
B_3906: cmp #$72
	bcc L_3917
	lda #$00
	sta V_7C13
	sta V_7C40
	lda #$71
	dec V_7C24
L_3917: sta V_7C0C
	rts
//$391B  --------
S_391B: lda V_7C1B
	beq B_398B
	lda V_7C1D
	sec
	sbc #$03
	jmp S_3FFD
//;
S_3929: lda V_7C1C
	sta V_7C02
	sta zp07
	lda V_7C1D
	sta V_398C
	lda V_7C3F
	cmp zp07
	bcs B_3941
	jsr S_39A5
B_3941: cmp zp07
	bcc B_398D
L_3945: sta V_7C1C
	lda V_7C1D
	bmi B_398B
	sta zp07
	jsr S_391B
	lda #$04
	sta V_7C1D
	lda #$00
	sta V_7C1B
	sta V_7C48
	lda zp07
	cmp #$07
	bcc B_398B
	lda #$03
	sta V_7C48
	lda zp07
	cmp #$08
	bcc B_398B
	lda #$04
	sta V_7C48
	lda zp07
	cmp #$09
	bcc B_398B
	lda #$05
	sta V_7C48
	lda zp07
	cmp #$0A
	bcc B_398B
	lda #$02
	sta V_7C48
B_398B: rts
//$398C  --------
V_398C: .byte $00
//;
B_398D: sta zp06
	lda #$C8
	cmp zp07
	bcs B_399A
	lda zp06
	jmp L_3945
//;
B_399A: lda zp07
	sta V_7C1C
	lda #$01
	sta V_7C1B
	rts
//$39A5  --------
S_39A5: inc V_7C1D
	lda zp07
	sec
	sbc V_7C1D
	sta zp07
	lda V_7C3F
	rts
//$39B4  --------
L_39B4: lda #$00
	sta zp04+1
	lda V_7C42
	sta zp02+1
	lda V_7C43
	sta zp02
	beq B_39FF
	lda zp02+1
	beq B_39DB
	and #$80
	sta zp02+1
	lda zp02
	and #$80
	cmp zp02+1
	bne B_39E2
	lda #$08
	sta zp04+1
	jmp L_39E6
//;
B_39DB: lda #$10
	sta zp04+1
	jmp L_39E6
//;
B_39E2: lda #$18
	sta zp04+1
L_39E6: lda zp04+1
	sta V_7C22
	beq B_3A0A
	cmp #$10
	beq B_3A16
	cmp #$18
	beq B_3A31
	jmp L_3A22
//;
L_39F8: sta V_7C0F
	sta V_7C24
B_39FE: rts
//$39FF  --------
B_39FF: lda #$00
	sta zp04+1
	lda zp02+1
	beq B_39FE
	jmp L_39E6
//;
B_3A0A: lda V_7C42
	clc
	adc V_7C24
	and #$07
	jmp L_39F8
//;
B_3A16: lda V_7C43
	clc
	adc V_7C24
	and #$07
	jmp L_39F8
//;
L_3A22: lda V_7C43
L_3A25: clc
	adc V_7C42
	adc V_7C24
	and #$07
	jmp L_39F8
//;
B_3A31: lda V_7C43
	eor #$FF
	clc
	adc #$01
	jmp L_3A25
//;
S_3A3C: asl
	sta zp02
	lda #$00
	rol
	sta zp02+1
	lda zp02
	adc #$00
	sta zp02
	lda zp02+1
	adc #$69
	sta zp02+1
	ldy #$00
	lda (zp02),y
	beq B_3A9E
	cmp #$E7
	beq B_3AA1
	sta V_7C26
	lda V_7C1C
	clc
	adc #$0C
	cmp V_7C26
	bcc B_3A9E
	iny
	lda (zp02),y
L_3A6B: sta V_7C27
	and #$3F
	asl
	tay
	jsr S_3A96
	clc
	adc #$EE
	sta V_7C2A
	lda #$7A
	adc #$00
	sta V_7C2B
	iny
	jsr S_3A96
	clc
	adc #$EE
	sta V_7C28
	lda #$00
	adc #$7A
	sta V_7C29
	lda #$00
	rts
//$3A96  --------
S_3A96: lda V_64B3,y
	asl  // mul * 16
	asl
	asl
	asl
	rts
//$3A9E  --------
B_3A9E: lda #$01
	rts
//$3AA1  --------
B_3AA1: lda V_7C1C
	sta V_7C26
	lda #$03
	sta V_3FFC
	jmp L_3A6B
//;
S_3AAF: sta V_7C30
	tya
	pha
	lda V_7C0B
	clc
	adc zp06
	and #$0F
	tay
	lda V_7C0C
	adc zp07
	and #$0F
	sta zp06
	lda V_7C2A
	sta zp08
	lda V_7C2B
	sta zp08+1
	lda (zp08),y
	sta zp07
	ldy zp06
	lda V_7C28
	sta zp08
	lda V_7C29
	sta zp08+1
	lda (zp08),y
	sta zp06
	ldy V_7C27
	lda V_641E,y
	beq B_3AF7
	lda zp06
	cmp zp07
	bcs L_3AFF
	lda zp07
	jmp L_3AFF
//;
B_3AF7: lda zp06
	cmp zp07
	bcc L_3AFF
	lda zp07
L_3AFF: sta zp07
	lda V_7C26
	clc
	adc zp07
	sta zp07
	lda V_7C30
	sta zp04+1
	cmp #$08
	beq B_3B25
	lda zp07
	sec
	sbc zp04+1
	sta zp04
	lda V_7C3F
	cmp zp04
	bcs B_3B25
	lda zp04
	sta V_7C3F
B_3B25: pla
	tay
	lda zp07
	sec
	sbc zp04+1
	rts
//$3B2D  --------
S_3B2D: lda #$00
	sta V_7C35
	ldy #$0E
B_3B34: sta V_7C31,y
	dey
	bpl B_3B34
	lda #$04
	sta zp06
B_3B3E: lda zp06
	pha
	jsr S_3B55
	pla
	sta zp06
	lda V_7C10
	sec
	sbc #$40
	sta V_7C10
	dec zp06
	bne B_3B3E
	rts
//$3B55  --------
S_3B55: lda V_7C3A
	bne B_3B5D
	jsr S_3C93
B_3B5D: lda V_7C36
	bne B_3B6A
	lda V_7C17
	beq B_3B6A
	jsr S_3D32
B_3B6A: lda V_7C37
	bne B_3B77
	lda V_7C19
	beq B_3B77
	jsr S_3D59
B_3B77: lda V_7C38
	bne B_3B84
	lda V_7C16
	beq B_3B84
	jsr S_3D80
B_3B84: lda V_7C39
	bne B_3B91
	lda V_7C18
	beq B_3B91
	jsr S_3DA6
B_3B91: lda V_7C31
	and #$01
	bne B_3BAA
	lda V_7C3B
	bne B_3BAA
	lda V_7C17
	and V_7C16
	and #$02
	beq B_3BAA
	jsr S_3DCC
B_3BAA: lda V_7C33
	and #$01
	bne B_3BC3
	lda V_7C3D
	bne B_3BC3
	lda V_7C16
	and V_7C19
	and #$02
	beq B_3BC3
	jsr S_3E16
B_3BC3: lda V_7C32
	and #$01
	bne B_3BDC
	lda V_7C3C
	bne B_3BDC
	lda V_7C19
	and V_7C18
	and #$02
	beq B_3BDC
	jsr S_3DF1
B_3BDC: lda V_7C34
	and #$01
	bne B_3BF5
	lda V_7C3E
	bne B_3BF5
	lda V_7C18
	and V_7C17
	and #$02
	beq B_3BF5
	jsr S_3E3B
B_3BF5: rts
//$3BF6  --------
S_3BF6: lda #$00
	sta zp04+1
	lda zp04
	pha
	lda #$01
	jsr S_3C32
	pla
	sta zp04
	and #$02
	bne B_3BF5
	lda zp04
	pha
	lda #$04
	jsr S_3C32
	pla
	and #$01
	bne B_3BF5
	lda #$08
	jsr S_3C32
	lda V_7C27
	cmp V_4204
	beq B_3C2B
	lda V_4205
	cmp V_7C27
	bne B_3C92
B_3C2B: inx
	lda #$00
	sta V_6442,x
	rts
//$3C32  --------
S_3C32: pha
	lda V_6482,y
	sta zp07
	dey
	lda V_6482,y
	sta zp06
	dey
	pla
	jsr S_3AAF
	sta V_6442,x
	dex
	rts
//$3C48  --------
S_3C48: lda zp04
	pha
	lda #$08
	jsr S_3C7D
	lda V_4204
	cmp V_7C27
	beq B_3C60
	lda V_4205
	cmp V_7C27
	bne B_3C67
B_3C60: dex
	lda #$00
	sta V_6442,x
	inx
B_3C67: pla
	sta zp04
	and #$02
	beq B_3C92
	lda zp04
	pha
	lda #$04
	jsr S_3C7D
	pla
	and #$04
	beq B_3C92
	lda #$01
S_3C7D: pha
	lda V_6482,y
	sta zp06
	iny
	lda V_6482,y
	sta zp07
	iny
	pla
	jsr S_3AAF
	sta V_6442,x
	inx
B_3C92: rts
//$3C93  --------
S_3C93: lda V_7C10
	jsr S_3A3C
	bne B_3C92
	lda #$01
	sta V_7C3A
	lda #$07
	sta zp07
	sta zp06
	lda #$00
	jsr S_3AAF
	sta zp07
	sta V_409C
	lda V_7C27
	sta V_4277
	lda V_7C1C
	inc zp07
	cmp zp07
	bcs B_3CC4
	lda #$01
	sta V_7C35
B_3CC4: lda V_7C10
	sta V_7C44
	lda V_7C17
	cmp #$07
	beq B_3CE4
	sta zp04
	lda #$0B  // $FF0B to $4204 (16bit value)
	sta V_4204
	lda #$FF
	sta V_4205
	ldx #$02
	ldy #$05
	jsr S_3BF6
B_3CE4: lda V_7C19
	cmp #$07
	beq B_3CFE
	sta zp04
	lda #$06  // $FF06 to $4204 (16bit value)
	sta V_4204
	lda #$FF
	sta V_4205
	ldy #$0B
	ldx #$05
	jsr S_3BF6
B_3CFE: lda V_7C16
	cmp #$07
	beq B_3D18
	sta zp04
	lda #$0A  // $0C0A to $4204 (16bit value)
	sta V_4204
	lda #$0C
	sta V_4205
	ldy #$11
	ldx #$08
	jsr S_3BF6
B_3D18: lda V_7C18
	cmp #$07
	beq B_3D64
	sta zp04
	lda #$07  // $1507 to $4204 (16bit value)
	sta V_4204
	lda #$15
	sta V_4205
	ldy #$17
	ldx #$0B
	jmp S_3BF6
//;
S_3D32: lda V_7C10
	clc
	adc #$08
	jsr S_3A3C
	bne B_3D64
	lda #$01
	sta V_7C36
	lda #$0B  // $FF0B to $4204 (16bit value)
	sta V_4204
	lda #$FF
	sta V_4205
	ldy #$00
	lda V_7C17
	sta zp04
	ldx #$00
	jsr S_3C48
	rts
//$3D59  --------
S_3D59: lda V_7C10
	sec
	sbc #$08
	jsr S_3A3C
	beq B_3D65
B_3D64: rts
//$3D65  --------
B_3D65: lda #$01
	sta V_7C37
	lda #$06  // $FF06 to $4204 (16bit value)
	sta V_4204
	lda #$FF
	sta V_4205
	ldy #$06
	ldx #$03
	lda V_7C19
	sta zp04
	jmp S_3C48
//;
S_3D80: lda V_7C10
	clc
	adc #$01
	jsr S_3A3C
	bne B_3DF0
	lda #$01
	sta V_7C38
	lda #$0A  // $0C0A to $4204 (16bit value)
	sta V_4204
	lda #$0C
	sta V_4205
	ldy #$0C
	lda V_7C16
	sta zp04
	ldx #$06
	jmp S_3C48
//;
S_3DA6: lda V_7C10
	sec
	sbc #$01
	jsr S_3A3C
	bne B_3DF0
	lda #$01
	sta V_7C39
	lda #$07  // $1507 to $4204 (16bit value)
	sta V_4204
	lda #$15
	sta V_4205
	ldy #$12
	lda V_7C18
	sta zp04
	ldx #$09
	jmp S_3C48
//;
S_3DCC: sta zp04
	lda V_7C10
	clc
	adc #$09
	jsr S_3A3C
	bne B_3DF0
	lda #$01
	sta V_7C3B
	lda V_649C
	sta zp06
	lda V_649D
	sta zp07
	lda #$08
	jsr S_3AAF
	sta V_644E
B_3DF0: rts
//$3DF1  --------
S_3DF1: sta zp04
	lda V_7C10
	sec
	sbc #$09
	jsr S_3A3C
	bne B_3DF0
	lda #$01
	sta V_7C3C
	lda V_64A8
	sta zp06
	lda V_64A9
	sta zp07
	lda #$08
	jsr S_3AAF
	sta V_644F
	rts
//$3E16  --------
S_3E16: sta zp04
	lda V_7C10
	sec
	sbc #$07
	jsr S_3A3C
	bne B_3E5F
	lda #$01
	sta V_7C3D
	lda V_64A2
	sta zp06
	lda V_64A3
	sta zp07
	lda #$08
	jsr S_3AAF
	sta V_6450
	rts
//$3E3B  --------
S_3E3B: sta zp04
	lda V_7C10
	clc
	adc #$07
	jsr S_3A3C
	bne B_3E5F
	lda #$01
	sta V_7C3E
	lda V_64AE
	sta zp06
	lda V_64AF
	sta zp07
	lda #$08
	jsr S_3AAF
	sta V_6451
B_3E5F: rts
//$3E60  --------
L_3E60: nop
	lda V_7C2E
	sta zp07
	bne B_3E72
B_3E68: lda V_7C40
	jsr S_3EF7
	sta V_7C40
	rts
//$3E72  --------
B_3E72: jsr S_3F1A
	beq B_3E68
	jsr S_3EB2
	lda V_7C40
	jsr S_3EBE
	ldx #$00
	jsr S_4278
	sta V_7C40
	rts
//$3E89  --------
L_3E89: nop
	lda V_7C2F
	sta zp07
	bne B_3E9B
B_3E91: lda V_7C41
	jsr S_3EF7
	sta V_7C41
	rts
//$3E9B  --------
B_3E9B: jsr S_3F1A
	beq B_3E91
	jsr S_3EB2
	lda V_7C41
	jsr S_3EBE
	ldx #$01
	jsr S_4278
	sta V_7C41
	rts
//$3EB2  --------
S_3EB2: pha
	ldy zp07
	lda V_6455,y
	sta zp02
	pla
	sta zp04
	rts
//$3EBE  --------
S_3EBE: cmp #$78
	bcs B_3EDE
	cmp #$0D
	bcc B_3EC9
	lda #$0C
	rts
//$3EC9  --------
B_3EC9: inc zp02
	cmp zp02
	bcs S_3EF7
	adc zp04
	bit zp02
	bmi B_3EE4
	cmp zp02
	bcc B_3EE4
	lda zp02
	sbc #$01
	rts
//$3EDE  --------
B_3EDE: cmp #$F4
	bcs B_3EE5
	lda #$F4
B_3EE4: rts
//$3EE5  --------
B_3EE5: cmp zp02
	bcc S_3EF7
	clc
	adc zp04
	bit zp02
	bpl B_3EF6
	cmp zp02
	bcs B_3EF6
	lda zp02
B_3EF6: rts
//$3EF7  --------
S_3EF7: cmp #$78
	bcs B_3F03
	cmp #$00
	beq B_3EF6
	sec
	sbc #$01
	rts
//$3F03  --------
B_3F03: clc
	adc #$01
	rts
//$3F07  --------
S_3F07: sta zp06
	lda #$00
	lsr zp07
	rol
	lsr zp07
	rol
	lsr zp07
	rol
	asl  // mul * 8
	asl
	asl
	ora zp06
	rts
//$3F1A  --------
S_3F1A: sta zp02
	jsr S_3F39
	lda zp02
	jsr S_3F4B
	lda zp07
	sec
	sbc zp06
	pha
	asl
	pla
	ror
	asl zp06
	clc
	adc zp06
	sta zp07
	tay
	lda V_6464,y
	rts
//$3F39  --------
S_3F39: ldy #$05  // $0500 to $06 (16bit value)
	sty zp07
	ldy #$00
	sty zp06
B_3F41: lsr
	bcs B_3F4A
	inc zp06
	dec zp07
	bne B_3F41
B_3F4A: rts
//$3F4B  --------
S_3F4B: asl  // mul * 4
	asl
	ldy #$06
	sty zp07
B_3F51: asl
	bcs B_3F58
	dec zp07
	bne B_3F51
B_3F58: rts
//$3F59  --------
S_3F59: lda V_7C42
	beq B_3F97
	cmp #$78
	bcc B_3F66
	eor #$FF
	adc #$00
B_3F66: cmp #$03
	bcc B_3F97
	lda V_7C43
	beq B_3F97
	cmp #$78
	bcc B_3F77
	eor #$FF
	adc #$00
B_3F77: cmp #$03
	bcc B_3F97
	lda V_7C40
	asl
	ror V_7C40
	lda V_7C41
	asl
	ror V_7C41
	lda V_7C13
	asl
	ror V_7C13
	lda V_7C12
	asl
	ror V_7C12
B_3F97: rts
//$3F98  --------
L_3F98: cmp #$00
	bne B_3F9F
	jmp L_3E60
//;
B_3F9F: ldx V_7C42
	stx zp04
	ldx #$01
	jsr S_402A
	cmp #$78
	bcc B_3FAF
	adc #$00
B_3FAF: sta V_7C13
	ldx #$01
	jsr S_4206
	sta V_7C0C
	lda #$00
	sta V_7C40
	lda V_3FFC
	beq B_3FC9
	lda #$00
	sta V_7C13
B_3FC9: rts
//$3FCA  --------
S_3FCA: cmp #$00
	bne B_3FD1
	jmp L_3E89
//;
B_3FD1: ldx V_7C43
	stx zp04
	ldx #$00
	jsr S_402A
	cmp #$78
	bcc B_3FE1
	adc #$00
B_3FE1: sta V_7C12
	ldx #$00
	jsr S_4206
	sta V_7C0B
	lda #$00
	sta V_7C41
	lda V_3FFC
	beq B_3FFB
	lda #$00
	sta V_7C12
B_3FFB: rts
//$3FFC  --------
V_3FFC: .byte $00
//;
S_3FFD: cmp #$FF
	beq B_401A
	cmp #$02
	bcc B_401A
	cmp #$FD
	bcs B_401B
	cmp #$04
	bcc B_401B
	cmp #$06
	bcc L_4015
	cmp #$FB
	bcc B_4020
//;
L_4015: lda #$00
	jsr S_2DB3
//;
B_401A: rts
//$401B  --------
B_401B: lda #$07
	jmp L_4015
//;
B_4020: lda #$03
	sta V_7C48
	lda #$09
	jmp L_4015
//;
S_402A: pha
	lda zp04
	clc
	rol zp04
	rol zp04
	jsr S_3FFD
	lda V_7C02
	cmp V_7C1C
	bcs B_4058
	cmp V_409C
	bcs B_4055
	sta V_7C1C
	sec
	sbc V_409C
	eor #$FF
	clc
	adc #$01
	cmp #$06
	bcs B_4058
	lda V_409C
B_4055: sta V_7C1C
B_4058: pla
	cmp #$20
	php
	lda #$05
	sta V_7C45
	lda zp04
	plp
	bne B_4076
	cmp #$78
	bcs B_409B
	dec V_7C0B,x
	pha
	lda #$FF
	sta zp07
	pla
	jmp L_4087
//;
B_4076: cmp #$00
	beq B_407E
	cmp #$78
	bcc B_409B
B_407E: inc V_7C0B,x
	pha
	lda #$01
	sta zp07
	pla
L_4087: eor #$FF
	clc
	adc #$01
	sta zp04
	lda V_7C24
	clc
	adc zp07
	and #$07
	sta V_7C24
	lda zp04
B_409B: rts
//$409C  --------
V_409C: .byte $00
//;
S_409D: ldx #$00
	jsr S_4116
	sta V_7C31
	jsr S_4116
	sta V_7C32
	jsr S_4116
	sta V_7C33
	jsr S_4116
	sta V_7C34
	lda V_7C1C
	sec
	sbc #$01
	sta zp04+1
	lda V_7C3B
	beq B_40D4
	lda zp04+1
	cmp V_6442,x
	bcs B_4115
	lda #$01
	sta V_7C31
	sta V_7C33
	rts
//$40D4  --------
B_40D4: inx
	lda V_7C3C
	beq B_40EA
	lda zp04+1
	cmp V_6442,x
	bcs B_4115
	lda #$01
	sta V_7C34
	sta V_7C32
	rts
//$40EA  --------
B_40EA: inx
	lda V_7C3D
	beq B_4100
	lda zp04+1
	cmp V_6442,x
	bcs B_4115
	lda #$01
	sta V_7C33
	sta V_7C32
	rts
//$4100  --------
B_4100: inx
	lda V_7C3E
	beq B_4115
	lda zp04+1
	cmp V_6442,x
	bcs B_4115
	lda #$01
	sta V_7C34
	sta V_7C31
B_4115: rts
//$4116  --------
S_4116: lda #$00
	sta zp04+1
	lda V_7C02
	sec
	sbc #$01
	cmp V_6442,x
	bcs B_4129
	lda #$01
	sta zp04+1
B_4129: inx
	lda V_7C1C
	sec
	sbc #$01
	cmp V_6442,x
	bcs B_413D
	pha
	lda zp04+1
	ora #$02
	sta zp04+1
	pla
B_413D: inx
	cmp V_6442,x
	bcs B_4149
	lda zp04+1
	ora #$04
	sta zp04+1
B_4149: inx
	lda zp04+1
	rts
//$414D  --------
L_414D: lda #$FF
	sta V_7C0E
	lda #$05
	sta V_7C45
	lda V_7C48
	cmp #$02
	bne B_4161
	jmp L_355C
//;
B_4161: cmp #$03
	bcs B_4187
B_4165: sta V_7C47
	lda #$00
	sta V_7C0F
	sta V_7C22
	lda V_7C0B
	bpl B_417A
	lda #$00
	sta V_7C0B
B_417A: lda V_7C0C
	bpl B_4184
	lda #$00
	sta V_7C0C
B_4184: jmp L_3555
//;
B_4187: cmp #$0A
	bcs B_4165
	jsr L_355C
	lda V_7C00
	sec
	sbc #$14
	sta V_7C00
	lda V_7C22
	sta zp06
	lda V_7C23
	sta zp07
	lda #$00
	sta V_7C22
	sta V_7C0F
	lda #$6B
	sta V_7C47
	jsr S_3562
	lda zp06
	sta V_7C22
	lda V_7C05
	cmp #$14
	bcs B_41C7
	ldy #$FF
	dec zp0D+1
	lda #$04
	sta (zp0D),y
	inc zp0D+1
B_41C7: rts
//$41C8  --------
S_41C8: lda V_7C31
	sta zp07
	lda V_7C32
	jsr S_3F07
	sta V_7C2E
	lda V_7C33
	sta zp07
	lda V_7C34
	jsr S_3F07
	sta V_7C2F
	ora V_7C2E
	bne B_41EC
	jsr S_422D
B_41EC: lda V_7C2F
	and #$21
	cmp #$21
	beq B_41F8
	jsr S_3FCA
B_41F8: lda V_7C2E
	and #$21
	cmp #$21
	beq B_421F
	jmp L_3F98
//;
V_4204: .byte $00
V_4205: .byte $00
//;
S_4206: cmp #$78
	bcc B_4220
	eor #$FF
	adc #$00
	pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	eor #$FF
	clc
	adc #$01
	clc
	adc V_7C0B,x
B_421F: rts
//$4220  --------
B_4220: pha
	asl
	pla
	ror
	pha
	asl
	pla
	ror
	clc
	adc V_7C0B,x
	rts
//$422D  --------
S_422D: lda V_4277
	cmp #$07
	beq B_424E
	cmp #$16
	beq B_424E
	cmp #$19
	beq B_4256
	cmp #$1C
	beq B_425E
	cmp #$1E
	bne B_4276
	lda #$04  // $0804 to $06 (16bit value)
	sta zp06
	lda #$08
	sta zp07
	bne B_4266
B_424E: lda #$04
	sta zp06
	sta zp07
	bne B_4266
B_4256: lda #$08
	sta zp07
	sta zp06
	bne B_4266
B_425E: lda #$08  // $0408 to $06 (16bit value)
	sta zp06
	lda #$04
	sta zp07
B_4266: lda V_7C2F
	ora zp06
	sta V_7C2F
	lda V_7C2E
	ora zp07
	sta V_7C2E
B_4276: rts
//$4277  --------
V_4277: .byte $00
//;
S_4278: cmp #$04
	sta zp07
	beq B_4290
	cmp #$FC
	bne B_429D
	lda V_7C2E,x
	and #$04
	php
	lda zp07
	plp
	beq B_429D
	jmp L_429B
//;
B_4290: lda V_7C2E,x
	and #$08
	php
	lda zp07
	plp
	beq B_429D
L_429B: lda #$00
B_429D: rts
//$429E  --------
//$429E  --------
	.byte $33,$1C,$43,$1C,$49,$1C,$63,$1C,$68,$1C,$6D,$1C,$72,$1C,$77,$1C
	.byte $7B,$1C,$7F,$1C,$88,$1C,$8B,$1C,$8E,$1C,$91,$1C,$96,$1C,$99,$1C
	.byte $AE,$1C,$B7,$1C,$BC,$1C,$C1,$1C

//; unused?
	.byte $4F,$53,$42,$4F,$52,$4E,$45,$3F
	.byte $20,$20,$42,$55,$4E,$47,$4F,$3F
	.byte $20,$20,$42,$45,$52,$54,$3F,$20
	.byte $20,$42,$41,$52,$4E,$41,$42,$59,$3F

	.byte $00,$00,$00,$00,$00

V_42EC: .byte $04
V_42ED: .byte $04
V_42EE: .byte $10,$10,$10,$10,$0F,$0F,$0E,$0E,$0D,$0C,$0C,$0A,$09,$08,$08,$1D
	.byte $74,$1D

//; 4300

	.import source "gfx_fixed.asm"
//;include "gfx_orig.asm"


numbers:  // 80*8 h none
//;db $12,$00,$3E,$67,$6B,$73,$63,$3E
	.byte $00,$00,$3E,$67,$6B,$73,$63,$3E
	.byte $00,$00,$1C,$2C,$0C,$0C,$0C,$3F
	.byte $00,$00,$3E,$63,$03,$3E,$61,$7F
	.byte $00,$00,$3E,$63,$0E,$03,$63,$3E
	.byte $00,$00,$0C,$1C,$2C,$4C,$7F,$0C
	.byte $00,$00,$7F,$60,$7E,$03,$63,$7E
	.byte $00,$00,$3E,$60,$7E,$63,$63,$3E
	.byte $00,$00,$7F,$63,$06,$08,$18,$18
	.byte $00,$00,$3E,$63,$3E,$63,$63,$3E
	.byte $00,$00,$3E,$63,$63,$3F,$43,$3E

	.byte 0,0
//;db $42,$32


	.byte $17,$FE,$2A,$03,$02,$FB,$47,$1A,$03,$FB,$4A,$22,$03,$2A
	.byte $03,$22,$03,$FB,$4F,$1A,$03,$FB,$51,$2A,$05,$FB,$57,$1A,$0E,$FE
	.byte $22,$05,$02,$FB,$5F,$1A,$1C,$FB,$66,$FD,$12,$04,$1C,$05,$02,$1E
	.byte $FB,$70,$1A,$1E,$12,$0D,$12,$1E,$FB,$74,$12,$19,$12,$1E,$FB,$77
	.byte $12,$19,$1A,$0D,$1A,$1E,$12,$04,$FB,$7C,$FD,$12,$04,$01,$0D,$02
	.byte $0F,$FB,$87,$2A,$01,$FB,$8A,$32,$17,$2A,$03,$32,$17,$FB,$8F,$2A
	.byte $01,$FB,$CB,$11,$91,$FF,$03,$20,$9F,$01,$11,$C5,$51,$3B,$10,$02
	.byte $31,$C7,$8C,$2F,$82,$1F,$49,$49,$9C,$00,$00,$00,$78

V_63CD: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00
V_63E1: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00
V_63F5: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_6400: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00
V_6409: .byte $00
V_640A: .byte $00,$00,$00,$00
V_640E: .byte $00
V_640F: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_641E: .byte $00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01
.byte $01,$01,$01,$01,$00,$01,$00,$00,$01,$00,$00,$00,$00,$01,$00,$01
	.byte $00,$00,$00,$00
V_6442: .byte $09,$0C,$0E,$09,$0D,$0E,$09,$0C,$0E,$09,$0D,$0E
V_644E: .byte $09
V_644F: .byte $09
V_6450: .byte $09
V_6451: .byte $09,$00,$00,$00
V_6455: .byte $0C,$0C,$0C,$0C,$08,$00,$F8,$F4,$F4,$F4,$F4,$00,$00,$00,$00
V_6464: .byte $02,$02,$02,$02,$01,$00,$FF,$FE,$FE,$FE,$FE,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_6482: .byte $07,$0E,$07,$0D,$07,$0A,$07,$00,$07,$01,$07,$05,$0E,$07,$0D,$07
.byte $0A,$07,$00,$07,$01,$07,$05,$07,$0E,$0E
V_649C: .byte $0D
V_649D: .byte $0D,$0A,$0A,$0E,$00
V_64A2: .byte $0D
V_64A3: .byte $01,$0A,$05,$00,$00
V_64A8: .byte $01
V_64A9: .byte $01,$05,$05,$00,$0E
V_64AE: .byte $01
V_64AF: .byte $0D,$05,$0A,$00
V_64B3: .byte $08,$08,$04,$0F,$0F,$04,$06,$06,$03,$0F,$0F,$03,$0F,$01,$0E,$0E
.byte $03,$03,$09,$09,$05,$0F,$0F,$02,$0F,$05,$03,$04,$04,$03,$04,$04
.byte $0F,$0E,$0F,$0F,$0E,$0E,$0B,$0B,$0F,$0F,$0E,$0F,$03,$03,$09,$09
.byte $0F,$00,$04,$04,$0D,$0D,$09,$09,$04,$03,$0C,$0C,$03,$04,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

//;
//; some time area
//;
V_6500: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

V_6570: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_6590: .byte $00
V_6591: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_6600: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00
V_6658: .byte $0A
V_6659: .byte $1C,$EB,$40,$00,$1C,$E8,$40,$40,$00,$2A,$00,$D4,$04,$A5,$1B,$1C
	.byte $C2,$70,$30,$01,$19,$30,$40,$01,$32,$1C,$05,$01,$19,$40,$40,$01
	.byte $32,$1C,$05,$05,$4E,$4E,$14,$08,$1A,$3A,$3A,$F2,$2D,$34,$17,$01
.byte $05,$20,$40,$01,$32,$80,$05,$01,$05,$50,$40,$01,$32,$80,$05,$01
.byte $05,$40,$50,$03,$2D,$96,$05,$00,$2A,$00,$E3,$05,$A0,$1B,$05,$10
	.byte $20,$14,$10,$06,$1B,$10,$10,$15,$1E,$24,$05,$0C,$15,$40,$40,$02
.byte $0A,$0A,$09,$E6,$E6,$1D,$9D,$A1,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00
V_6700: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
V_67B6: .byte $07,$0F,$68,$23,$05,$E0,$2D,$04,$35,$84,$04,$49,$1F,$0F,$40,$21
	.byte $0E,$97,$8A,$0F,$28,$24,$00,$00
V_67CE: .byte $0F
V_67CF: .byte $11
V_67D0: .byte $1E,$24,$03,$00,$62,$01,$28,$01,$08,$27,$FF,$F8,$82,$03,$75,$0E
	.byte $2C,$26,$03,$00,$55,$01,$28,$01,$08,$27,$FF,$F8,$82,$03,$75,$0E
.byte $12,$12,$17,$19,$61,$61,$22,$00,$01,$08,$3C,$E1,$F8,$12,$4A,$17
V_6800: .byte $5D,$1E,$1E,$26,$03,$00,$64,$01,$28,$01,$08,$27,$FF,$F8,$82,$03
	.byte $75,$04,$3A,$3A,$17,$09,$9C,$02,$02,$00,$01,$08,$3C,$FF,$F8,$12
	.byte $4A,$17,$5D,$1E,$1E,$1E,$13,$00,$5B,$01,$28,$01,$02,$15,$FF,$FE
	.byte $82,$03,$75,$04,$1E,$19,$17,$00,$64,$01,$28,$01,$08,$27,$FF,$F8
	.byte $82,$03,$75,$0E,$14,$14,$17,$09,$64,$2C,$24,$00,$01,$08,$28,$FF
	.byte $F8,$14,$4A,$17,$5D,$00,$12,$12,$03,$19,$65,$3C,$01,$00,$01,$08
	.byte $28,$FF,$F8,$12,$4A,$00,$00,$00,$22,$22,$03,$19,$74,$EC,$34,$00
.byte $03,$10,$2A,$FC,$F0,$12,$00,$00,$00,$00,$22,$24,$03,$00,$64,$01
	.byte $32,$01,$02,$18,$FC,$FC,$82,$03,$75,$04,$42,$42,$13,$19,$E3,$01
.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$23,$14,$03,$00
	.byte $73,$02,$28,$04,$02,$14,$FC,$FB,$00,$00,$00,$00,$28,$1D,$17,$00
	.byte $64,$01,$32,$01,$02,$24,$F9,$F8,$00,$00,$00,$00,$1E,$1E,$03,$00
	.byte $6B,$01,$28,$01,$08,$27,$FF,$F8,$82,$00,$00,$00,$32,$32,$17,$89
	.byte $44,$45,$44,$00,$01,$08,$32,$FF,$F8,$12,$00,$00,$00,$00,$32,$32
	.byte $17,$89,$45,$45,$44,$00,$01,$08,$32,$FF,$F8,$12,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

//;
//; *** Start ***
//;
X_6900: sei
	sta $FF3F
//;
	lda #$0B
	sta $FF06
//;
	lda #bitmap >> 10
//;lda #$8000 >> 10
	sta $FF12  // Sound1 Freq Hi / Gfx
//;
	lda #colmap >> 8
	sta $FF14  // Video Matrix
//;
	lda #$00
	sta $FF19  // Border Color
//;
	ldx #$07
	ldy #$00
	tya
il1: sta colmap,y  // fill color map with zeroes
	iny
	bne il1
//;
	inc il1+2
	dex
	bpl il1
//;
	txa
	ldx #$1F
il2: sta bitmap,y  // fill bitmaps with $FF
	iny
	bne il2
//;
	inc il2+2
	dex
	bpl il2
//;
	lda #$B6  // $2DB6 to $FFFA (16bit value)
	sta $FFFA
	lda #$2D
	sta $FFFB
//;
	ldx #$00
B_6951: lda V_6A00,x
	sta font,x
	lda V_9C40,x
	sta splat,x
	lda V_9D40,x
	sta splat+$100,x
	dex
	bne B_6951
//;
//	ldx #$0F
//B_696B	lda V_6977,x
//	sta V_0800,x	; screen colour mem
//	dex
//	bpl B_696B
//;
	lda #$3B
	sta $FF06  // Vert Scroll

//---------------------------------------------------------------- cheatek

//; orokido - oke

	lda #$2c
	sta $9ba2
	sta $9bb8

//	; unsmashable brothers -- b0 (bcs) helyett bit      

//  	lda #$24
//  	sta $1451

// 	; ctrl to block freezer/unfreezer

//  	lda #$20
//  	sta $9b95
//  	lda #$9c
//  	sta $9b96
//  	lda #$af
//  	sta $9b97

// af9c (c64)

// 	lda $dc01
//	cmp #$fb
//	bne $afbd
//	ldx #$08
//afa5	bit $d011
//	bpl $afa5
//afaa	bit $d011
//	bmi $afaa
//	dex
//	bpl $afa5
//	lda $0872
//	eor #$0c
//	sta $0872
//	lda $dc01
//afbd	rts
//	lda $dd0d
//	cli
//	jmp $0827

//-------------

//  	lda #$20
//  	sta $9b95
//  	lda #$d5
//  	sta $9b96
//  	lda #$c2
//  	sta $9b97


//;;	

// q key dont kill brothers    - tesztelendo
//       ;>1453 20 BE CA EA

//	lda #$20
//	sta $1453
//	lda #$BE
//	sta $1454
//	lda #$C2
//	sta $1455
//	lda #$EA
//	sta $1456

//	; azaz jsr $cabe    plus4en atraktam c2be-re

// $cabe rutin
// cmp #$02
// bne $cad4 
// lda $7c7a
// sta $7c6e
// lda $7c7b
// sta $7c6f
// lda $7c7c
// sta $7c71
// $cad4 rts


// 	; spectrum spawn positions   - tesztelendo

//  	ldx #$03
//speccy  lda $c2a3,x
//	sta $6b00,x 
// 	lda $c2a7,x
//	sta $6b08,x
// 	lda $c2ab,x
// 	sta $6b14,x
// 	lda $c2af,x
//	sta $6b10,x
// 	lda $c2b3,x
// 	sta $6b18,x
// 	dex
// 	bpl speccy



//; starting brother   5 - barnaby, 4 - bert, 3 - bungo, 2 - boogle, 1 - osborne, 0 - endseq          -- ok

	lda #$05
	sta $1402

	lda #$00
	sta $c300

//---------------------------------------------------------------- cheatek
//;
	jmp L_0827  // screen colour mem
//;
//V_6977	db "L6",$08,$4C,$97,$19,"La",$0E,$4C,$D9,$19,$32,$18,$EF,$18
//	db $00,$C9,$A2,$0F,$BD,$97,$69,$9D,$00,$08,$CA,$10,$F7,"L'",$08
//	db "L6",$08,$4C,$97,$19,"La",$0E,$4C,$D9,$19,$32,$18,$EF,$18
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
//	db $00,$00,$00,$00,$00,$00,$00,$00,$00

	.align 256
V_6A00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$1F
	.byte $00,$00,$00,$00,$00,$00,$FF,$FF,$00,$00,$00,$00,$00,$00,$E0,$FC
	.byte $1F,$03,$00,$00,$00,$00,$00,$00,$FF,$FF,$00,$00,$00,$00,$00,$00
	.byte $FC,$E0,$00,$00,$00,$00,$00,$00,$00,$3E,$63,$63,$7F,$63,$63,$00
	.byte $00,$7E,$63,$7E,$63,$63,$7E,$00,$00,$3E,$63,$60,$60,$63,$3E,$00
	.byte $00,$7C,$62,$63,$63,$62,$7C,$00,$00,$7F,$60,$7E,$60,$63,$7F,$00
	.byte $04,$3C,$40,$40,$3F,$01,$02,$FE,$00,$3E,$63,$60,$67,$63,$3E,$00
	.byte $00,$63,$63,$7F,$63,$63,$63,$00,$1C,$0E,$0E,$0E,$0E,$0E,$0E,$1C
	.byte $00,$03,$03,$03,$63,$63,$3E,$00,$1C,$38,$38,$38,$38,$38,$38,$1C
	.byte $00,$60,$60,$60,$60,$63,$7F,$00,$00,$43,$67,$7B,$63,$63,$63,$00
	.byte $00,$43,$63,$73,$6B,$67,$63,$00,$00,$3E,$63,$63,$63,$63,$3E,$00
	.byte $00,$7E,$63,$63,$7E,$60,$60,$00,$00,$3E,$73,$63,$73,$6B,$3E,$02
	.byte $00,$7E,$63,$63,$7E,$67,$63,$00,$00,$3E,$60,$3E,$03,$73,$3E,$00
	.byte $00,$7F,$18,$18,$18,$18,$18,$00,$00,$63,$63,$63,$63,$63,$3E,$00
	.byte $00,$63,$63,$63,$63,$26,$1C,$00,$00,$63,$63,$63,$63,$7B,$26,$00
	.byte $00,$43,$67,$18,$18,$67,$43,$00,$00,$C3,$67,$3E,$1C,$18,$18,$00

//; brother spawn positions?
V_6B00:
	.byte $30,$60,$11,$07,$40,$40,$39,$71,$40,$10,$11,$84,$40,$60,$19,$50
	.byte $10,$10,$28,$51,$70,$40,$11,$D7,$40,$40,$11,$96,$30,$10,$18,$39

V_6B20: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$DF
	.byte $68,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$9F,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$68,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$6B,$00
	.byte $81,$DF,$FF,$9F,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$0E,$80,$CF
	.byte $DC,$C7,$A6,$C1,$86,$01,$A6,$03,$9D,$07,$40,$FA,$40,$06,$20,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$60,$02,$A0,$03
	.byte $9C,$07,$A6,$E7,$86,$E7,$A6,$C1,$9E,$01,$42,$02,$41,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$18,$28,$04,$48,$02,$48,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$07,$AE,$67,$9C,$EF,$44,$C2,$44,$02,$32,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1A,$18,$24,$04,$48,$02,$48,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$01,$AE,$01,$9C,$07,$48,$C6,$49,$CE,$29,$FC
V_6C00: .byte $1F,$F8,$07,$E0,$07,$E0,$19,$18,$32,$04,$44,$02,$48,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$01,$A6,$01,$9C,$01,$50,$02,$50,$06,$39,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$38,$24,$78,$C2,$41,$02,$82,$01
	.byte $BC,$01,$A6,$01,$86,$01,$A6,$01,$BC,$01,$40,$02,$40,$0E,$21,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$38,$04,$7C,$1E,$58,$22,$80,$C1
	.byte $BD,$01,$86,$01,$86,$01,$A6,$01,$FC,$01,$40,$02,$40,$0E,$21,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$38,$22,$1C,$47,$02,$43,$82,$80,$03
	.byte $9C,$05,$A6,$19,$C3,$E1,$A2,$01,$BE,$01,$5C,$02,$40,$0E,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $8C,$31,$8C,$31,$AC,$35,$90,$09,$90,$0B,$58,$1E,$67,$EE,$20,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $80,$01,$8C,$31,$8C,$31,$AC,$35,$90,$09,$50,$0E,$78,$1E,$27,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$28,$14,$50,$0A,$40,$02,$80,$01
	.byte $80,$01,$80,$01,$80,$01,$80,$01,$8C,$31,$4C,$32,$6C,$3E,$2F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$28,$1C,$57,$EE,$50,$0A,$A0,$09
	.byte $A0,$05,$80,$01,$80,$01,$80,$01,$80,$01,$40,$02,$6C,$3E,$2F,$FC
V_6D00: .byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$2C,$34,$70,$0A,$50,$0A,$90,$09
	.byte $98,$19,$A7,$E5,$80,$01,$80,$01,$80,$03,$40,$06,$40,$1E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$2C,$34,$4C,$36,$62,$0A,$90,$09
	.byte $90,$09,$9F,$F9,$A0,$05,$80,$01,$80,$03,$40,$06,$40,$1E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$4C,$32,$4C,$32,$8C,$31
	.byte $A0,$05,$90,$09,$98,$19,$97,$E9,$A0,$0D,$40,$06,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$8C,$31
	.byte $8C,$31,$AC,$35,$90,$09,$90,$09,$98,$1B,$67,$EE,$60,$0E,$20,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$70,$02,$F3,$03
	.byte $E3,$1D,$83,$4D,$83,$4D,$C0,$7D,$E0,$B9,$5F,$02,$40,$06,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$C0,$03
	.byte $E0,$1D,$E7,$4D,$E7,$6D,$83,$7D,$80,$39,$40,$22,$71,$CE,$2E,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$58,$20,$24,$40,$12,$40,$12,$80,$11
	.byte $80,$19,$C0,$4D,$E0,$4D,$E3,$7D,$F3,$B9,$41,$A2,$40,$2E,$20,$5C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$D8,$20,$24,$40,$12,$40,$0A,$80,$09
	.byte $80,$19,$80,$4D,$80,$4D,$C0,$7D,$E0,$39,$63,$0A,$63,$8E,$23,$9C
V_6E00: .byte $19,$F8,$07,$E0,$07,$E0,$1D,$18,$30,$4C,$60,$22,$40,$12,$80,$11
	.byte $80,$19,$80,$4D,$80,$4D,$80,$7D,$80,$39,$40,$0A,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$2C,$1C,$43,$1E,$40,$82,$80,$41
	.byte $80,$29,$80,$4D,$80,$6D,$80,$7D,$80,$3D,$40,$06,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$08,$20,$3C,$78,$3E,$44,$02,$83,$01
	.byte $80,$89,$80,$6D,$80,$45,$80,$7D,$80,$39,$40,$02,$40,$0E,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$18,$38,$44,$40,$E2,$41,$C2,$C0,$81
	.byte $A0,$19,$98,$4D,$87,$CF,$80,$79,$80,$39,$40,$02,$40,$06,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$4C,$02,$5C,$02,$D8,$01
	.byte $C0,$01,$A1,$81,$96,$41,$8E,$21,$84,$63,$4E,$FE,$47,$FE,$33,$FC
	.byte $1D,$F8,$07,$E0,$07,$E0,$18,$18,$23,$04,$47,$02,$46,$02,$A0,$01
	.byte $A0,$01,$91,$81,$8E,$41,$86,$21,$84,$63,$4E,$D6,$47,$FE,$33,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$23,$84,$63,$82,$60,$02,$90,$01
	.byte $90,$01,$89,$81,$86,$41,$86,$61,$84,$63,$4E,$D6,$47,$FE,$33,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$19,$18,$22,$04,$42,$12,$42,$3A,$82,$19
	.byte $81,$01,$81,$81,$82,$41,$86,$61,$94,$63,$5E,$D6,$4F,$BE,$30,$FC
V_6F00: .byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$1A,$40,$22,$80,$21
	.byte $80,$41,$80,$4D,$A2,$8D,$B6,$65,$BC,$67,$56,$F6,$47,$BE,$32,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $B0,$07,$B0,$09,$A2,$D1,$86,$61,$8C,$67,$46,$F6,$4F,$BE,$30,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$48,$02,$48,$02,$98,$01
	.byte $90,$01,$81,$81,$82,$41,$C6,$41,$BC,$6F,$46,$FA,$43,$BE,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$4C,$02,$5C,$02,$98,$01
	.byte $80,$01,$80,$81,$C2,$41,$BE,$41,$84,$67,$46,$FA,$43,$BE,$23,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$06,$40,$02,$80,$4F
	.byte $DC,$E3,$A6,$41,$86,$01,$A6,$03,$9D,$0F,$40,$92,$40,$66,$20,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$60,$02,$A0,$03
	.byte $9C,$43,$A6,$43,$86,$F7,$A6,$43,$9E,$81,$42,$02,$41,$0E,$21,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$18,$28,$04,$48,$02,$48,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$03,$AE,$A3,$9C,$6F,$44,$A6,$48,$02,$34,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1A,$18,$22,$04,$42,$02,$44,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$01,$AE,$01,$9C,$07,$48,$46,$49,$8E,$31,$FC
V_7000: .byte $1F,$F8,$07,$E0,$07,$E0,$19,$18,$31,$04,$46,$02,$48,$02,$88,$01
	.byte $9C,$01,$A6,$01,$86,$01,$A6,$01,$9C,$01,$50,$02,$50,$06,$39,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$3C,$24,$50,$22,$40,$22,$83,$C1
	.byte $BC,$01,$A6,$01,$86,$01,$A6,$01,$BC,$01,$60,$02,$40,$0E,$21,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$58,$24,$04,$78,$0E,$4C,$12,$80,$11
	.byte $BD,$E1,$86,$01,$86,$01,$A6,$01,$FC,$01,$40,$02,$40,$0E,$21,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$38,$22,$2C,$43,$82,$45,$02,$80,$03
	.byte $9C,$05,$A6,$09,$83,$89,$E2,$71,$BE,$01,$5C,$02,$40,$0E,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $84,$21,$9E,$79,$A4,$25,$90,$09,$90,$0B,$50,$1E,$68,$EE,$27,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $80,$01,$84,$21,$9E,$79,$A4,$25,$90,$09,$50,$0E,$78,$1E,$24,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$78,$2C,$94,$53,$0A,$40,$02,$80,$01
	.byte $80,$01,$80,$01,$80,$01,$80,$01,$84,$21,$5E,$7A,$64,$3E,$2F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$28,$1C,$58,$6E,$54,$8A,$A3,$09
	.byte $A0,$05,$80,$01,$80,$01,$80,$01,$80,$01,$40,$02,$64,$3E,$2F,$FC
V_7100: .byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$24,$24,$70,$0A,$50,$0A,$90,$09
	.byte $90,$19,$A8,$65,$84,$81,$83,$01,$80,$03,$40,$06,$40,$1E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$38,$3E,$74,$44,$26,$60,$0A,$90,$09
	.byte $90,$09,$90,$59,$A8,$A5,$87,$01,$80,$03,$40,$06,$40,$1E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$44,$22,$5E,$7A,$84,$21
	.byte $A0,$05,$90,$09,$90,$19,$98,$69,$A4,$8D,$43,$06,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$84,$21
	.byte $9E,$79,$A4,$25,$90,$09,$90,$09,$90,$1B,$68,$6E,$64,$8E,$23,$3C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$60,$02,$60,$02,$F1,$03
	.byte $C3,$9D,$81,$4D,$80,$4D,$C0,$7D,$E0,$B9,$59,$02,$46,$06,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$C0,$03
	.byte $C0,$1D,$E2,$4D,$CF,$6D,$82,$7D,$81,$39,$40,$22,$71,$CE,$2E,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$58,$20,$44,$40,$32,$40,$12,$80,$11
	.byte $80,$19,$80,$4D,$C2,$4D,$C1,$FD,$F3,$39,$45,$A2,$40,$2E,$20,$5C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$D8,$20,$44,$40,$22,$40,$1A,$80,$09
	.byte $80,$19,$80,$4D,$80,$4D,$C0,$7D,$C0,$39,$62,$0A,$61,$8E,$23,$1C
V_7200: .byte $19,$F8,$07,$E0,$07,$E0,$1D,$18,$20,$8C,$40,$82,$40,$62,$80,$11
	.byte $80,$19,$80,$4D,$80,$4D,$80,$7D,$80,$39,$40,$0A,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$2C,$0C,$42,$16,$42,$02,$81,$C1
	.byte $80,$29,$80,$4D,$80,$6D,$80,$7D,$80,$3D,$40,$06,$40,$0E,$20,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$19,$08,$20,$14,$78,$3E,$44,$0A,$84,$01
	.byte $83,$89,$80,$6D,$80,$45,$80,$7F,$80,$39,$40,$02,$40,$0E,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1C,$18,$31,$44,$40,$C2,$40,$A2,$C0,$81
	.byte $A0,$19,$90,$4D,$89,$CF,$86,$79,$80,$39,$40,$02,$40,$06,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$5C,$02,$58,$02,$D4,$01
	.byte $C0,$01,$A1,$81,$A6,$41,$9E,$21,$84,$63,$4E,$FE,$47,$FE,$33,$FC
	.byte $1D,$F8,$07,$E0,$07,$E0,$18,$18,$25,$04,$43,$02,$46,$02,$A1,$01
	.byte $A0,$01,$A1,$81,$9E,$41,$86,$21,$84,$63,$4E,$D6,$47,$FE,$33,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$21,$04,$63,$82,$61,$02,$90,$01
	.byte $90,$01,$91,$81,$8E,$41,$86,$61,$84,$63,$4E,$D6,$47,$FE,$33,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$19,$18,$22,$04,$42,$1A,$42,$1A,$82,$29
	.byte $81,$01,$81,$81,$82,$41,$86,$61,$94,$63,$5E,$D6,$4F,$BE,$30,$FC
V_7300: .byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$1A,$40,$22,$80,$21
	.byte $80,$41,$80,$4D,$A2,$87,$A6,$6D,$FC,$67,$56,$F6,$47,$BE,$32,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$01
	.byte $90,$0F,$F8,$11,$A2,$D1,$86,$61,$8C,$67,$46,$F6,$4F,$BE,$30,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$44,$02,$58,$02,$8C,$01
	.byte $90,$01,$81,$81,$82,$41,$C6,$41,$BC,$6F,$46,$FA,$43,$BE,$20,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$18,$18,$20,$04,$54,$02,$58,$02,$94,$01
	.byte $80,$01,$80,$81,$C2,$41,$AE,$41,$94,$67,$46,$FA,$43,$BE,$23,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FA,$FF,$79
	.byte $E7,$33,$EF,$5F,$FF,$FF,$FD,$FD,$FC,$F9,$7E,$02,$7E,$4A,$3E,$DC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$5F,$FE,$7F,$FE,$FF,$FD
	.byte $E7,$7D,$EF,$39,$FF,$5B,$FB,$DF,$F3,$FF,$7D,$FC,$7C,$72,$38,$04
	.byte $1F,$B8,$07,$E0,$07,$E0,$19,$F8,$3B,$FC,$7F,$FE,$7F,$FE,$FF,$FF
	.byte $E7,$FF,$EF,$FF,$FF,$7D,$FF,$7D,$F2,$31,$62,$BA,$7B,$FE,$31,$FC
	.byte $18,$78,$07,$E0,$07,$E0,$1C,$38,$39,$FC,$71,$FE,$7F,$FE,$FF,$FF
	.byte $E7,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$F7,$BD,$67,$3A,$76,$BA,$23,$FC
V_7400: .byte $18,$F8,$07,$E0,$07,$E0,$1F,$18,$3C,$4C,$78,$7E,$7E,$FE,$FF,$FF
	.byte $E7,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$37,$FC
	.byte $19,$F8,$07,$E0,$07,$E0,$1F,$F8,$31,$FC,$77,$E2,$7F,$02,$FC,$09
	.byte $E4,$4F,$EE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$C8,$3F,$E4,$78,$FE,$7B,$FE,$FF,$C1
	.byte $E6,$09,$EC,$4D,$FE,$6F,$FE,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$E4,$7C,$76,$7D,$7E,$FF,$7F
	.byte $E7,$FD,$ED,$F1,$FC,$01,$FC,$89,$FD,$9B,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FE,$FF,$FF
	.byte $F7,$EF,$B3,$CF,$B3,$CF,$F5,$AF,$FF,$FF,$4F,$FA,$47,$F6,$30,$04
.byte $1A,$58,$07,$E0,$07,$E0,$1A,$58,$37,$EC,$7F,$FE,$7F,$FE,$FF,$FF
	.byte $FF,$FF,$BF,$FF,$BF,$FF,$F3,$CF,$F1,$8F,$75,$AE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1A,$58,$3A,$5C,$6F,$F6,$7F,$F6,$FF,$FF
	.byte $FF,$FF,$BF,$FF,$BF,$FF,$FF,$FF,$F3,$CF,$71,$8E,$77,$EE,$3B,$DC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$78,$1E,$62,$46,$D2,$4B
	.byte $9F,$F9,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$77,$DE,$33,$9C
V_7500: .byte $1F,$F8,$07,$E0,$07,$E0,$19,$98,$35,$AC,$7F,$FE,$7F,$FE,$E0,$07
	.byte $92,$41,$92,$49,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1B,$D8,$31,$8C,$75,$AE,$7F,$FE,$FF,$FF
	.byte $FF,$FF,$80,$01,$92,$49,$F2,$4F,$FE,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$37,$EC,$73,$CE,$71,$8E,$F5,$AF
	.byte $FF,$FF,$BF,$FD,$8F,$F1,$80,$09,$D2,$4B,$72,$4E,$7E,$7E,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FE,$F7,$EF
	.byte $F3,$CF,$B5,$AF,$BD,$BF,$FF,$FD,$DF,$FB,$47,$F2,$50,$0A,$32,$4C
	.byte $1E,$78,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$5F,$FE,$9E,$FF
	.byte $CC,$FF,$FA,$FF,$FF,$FF,$BF,$BF,$9F,$3F,$40,$7E,$52,$7E,$3B,$7C
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FA,$7F,$FE,$BF,$FF
	.byte $BE,$FF,$9C,$FF,$DA,$FF,$FB,$DF,$FF,$CF,$3F,$BE,$4E,$3E,$20,$1C
	.byte $1D,$F8,$07,$E0,$07,$E0,$1F,$98,$3F,$DC,$7F,$FE,$7F,$FE,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$BE,$FF,$BE,$FF,$8C,$4F,$5D,$46,$7F,$DE,$3F,$8C
	.byte $1E,$18,$07,$E0,$07,$E0,$1C,$38,$3F,$9C,$7F,$8E,$7F,$FE,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$BD,$EF,$5C,$E6,$5D,$6E,$3F,$C4
V_7600: .byte $1F,$18,$07,$E0,$07,$E0,$18,$F8,$32,$3C,$7E,$1E,$7F,$7E,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$EC
	.byte $1F,$98,$07,$E0,$07,$E0,$1F,$F8,$3F,$8C,$47,$EE,$40,$FE,$90,$3F
	.byte $F2,$1F,$FF,$7F,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$13,$F8,$27,$FC,$7F,$1E,$7F,$DE,$83,$FF
	.byte $90,$7F,$B2,$3F,$F6,$7F,$FF,$7F,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$27,$FC,$6E,$3E,$7E,$BE,$FE,$FF
	.byte $BF,$FF,$8F,$BF,$80,$3F,$91,$3F,$D9,$BF,$7F,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7B,$FE,$F3,$FF
	.byte $BB,$FF,$BF,$FF,$8F,$FF,$83,$FF,$D1,$FB,$73,$E2,$7F,$F6,$3F,$FC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$58,$FE,$9E,$FF
	.byte $8F,$FF,$87,$FF,$A3,$FF,$E1,$FF,$EB,$FF,$7F,$FE,$7F,$CE,$3F,$EC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$2F,$FC,$4F,$FE,$4E,$3E,$86,$7F
	.byte $E7,$FF,$C3,$FF,$FB,$FF,$F1,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$9C
	.byte $1F,$B8,$07,$E0,$07,$E0,$18,$F8,$31,$FC,$7D,$FE,$71,$CE,$F9,$E7
	.byte $FD,$EF,$F9,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3E,$FC
V_7700: .byte $1E,$78,$07,$E0,$07,$E0,$1F,$F8,$3F,$84,$7F,$C6,$7F,$1E,$FF,$9F
	.byte $FE,$3F,$FF,$7B,$CF,$F3,$CF,$F3,$DF,$FF,$7F,$FE,$79,$FE,$39,$FC
	.byte $18,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$F6,$7F,$F2,$FF,$D3
	.byte $FF,$C3,$DF,$CF,$CF,$9F,$DF,$BF,$DF,$F3,$7F,$F2,$79,$FE,$33,$FC
	.byte $1B,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FA,$FF,$E9
	.byte $CF,$E1,$CF,$E1,$DF,$8F,$FF,$BF,$F7,$FF,$43,$FE,$4F,$E6,$2F,$EC
	.byte $1F,$F8,$07,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$77,$FE,$E7,$FF
	.byte $F3,$FF,$FF,$F5,$9F,$F1,$81,$E1,$93,$FB,$53,$FE,$7F,$FE,$3F,$FC
	.byte $1F,$F8,$07,$E0
V_7784: .byte $07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FE,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE,$3F,$FC,$1F,$F8,$07,$E0
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$06,$00,$19,$83,$60,$6D
	.byte $80,$11,$E0,$01,$F8,$01,$7C,$01,$10,$01,$C0,$01,$FF,$FF,$FF,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$06,$00,$1F,$83,$7F,$EF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$7F,$FF,$1F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$80,$03,$80,$0F,$80,$3F,$80,$0C,$80,$03,$8C,$0C,$BF,$30
	.byte $FF,$C0,$F0,$00,$C0,$00,$00,$00,$00,$00,$00,$00
V_7800: .byte $00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FC,$FF,$FF
	.byte $FF,$FC,$FF,$F0,$FF,$C0,$F0,$00,$C0,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$60
	.byte $C1,$98,$B6,$06,$88,$01,$80,$07,$80,$1F,$80,$3E,$80,$08,$80,$03
	.byte $FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$60
	.byte $C1,$F8,$F7,$FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$F8,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$C0,$01,$F0,$01,$FC,$01,$30,$01,$C0,$01
	.byte $30,$31,$0C,$FD,$03,$FF,$00,$0F,$00,$03,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$3F,$FF,$FF,$FF
	.byte $3F,$FF,$0F,$FF,$03,$FF,$00,$0F,$00,$03,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$07,$E0,$18,$18,$20,$04,$40,$02,$40,$02,$80,$05
	.byte $80,$03,$80,$05,$80,$03,$80,$05,$80,$0B,$40,$17,$40,$AB,$25,$57
	.byte $1A,$BE,$07,$F8,$27,$E4,$78,$1E,$F8,$1F,$7C,$3E,$7E,$7E,$9F,$FD
	.byte $8F,$F3,$87,$E5,$87,$E3,$8F,$F5,$9F,$FB,$7E,$7F,$7C,$BE,$F9,$5F
	.byte $7A,$BE,$27,$F4,$00,$00,$0F,$F0,$3F,$FC,$7F,$FC,$78,$7E,$78,$7C
	.byte $7C,$7C,$39,$F8,$03,$F0,$07,$C0,$07,$80,$03,$C0,$00,$00,$07,$80
V_7900: .byte $07,$C0,$03,$80,$0F,$F0,$3F,$FC,$7F,$FE,$FF,$FE,$FF,$FF,$FC,$FE
	.byte $FF,$FE,$7F,$FC,$3F,$F8,$0F,$F0,$0F,$C0,$07,$E0,$07,$C0,$0F,$C0
	.byte $0F,$E0,$07,$C0,$00,$00,$1F,$F0,$0F,$E0,$0F,$E0,$07,$C0,$07,$C0
	.byte $03,$80,$03,$80,$7F,$FC,$3F,$F8,$1F,$F0,$0F,$E0,$07,$C0,$03,$80
	.byte $01,$00,$00,$00,$3F,$F8,$3F,$F8,$1F,$F0,$1F,$F0,$0F,$E0,$0F,$E0
	.byte $07,$C0,$FF,$FE,$FF,$FE,$7F,$FC,$3F,$F8,$1F,$F0,$0F,$E0,$07,$C0
	.byte $03,$80,$01,$00,$E0,$07,$E0,$1F,$F8,$3F,$FC,$7F,$FE,$7F,$FE,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$7F,$FE,$7F,$FE
	.byte $3F

NAMES:
	.byte $4F,$53,$42,$4F,$52,$4E,$45,$3F
	.byte $42,$4F,$4F,$47,$4C,$45,$3F,$20
	.byte $20,$42,$55,$4E,$47,$4F,$3F,$20
	.byte $20,$42,$45,$52,$54,$3F,$20,$20
	.byte $42,$41,$52,$4E,$41,$42,$59,$3F

V_7986:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00

	.if (* < $79B8) { .fill $79B8-*, $FF }
	* = $79B8
V_79B8: .byte $00,$00,$00,$00,$00,$00,$00,$DF,$28,$FF,$FF,$FF,$FF,$FF,$FF,$9F
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$91,$FF
V_79E0: .byte $01,$D4,$10,$30,$20,$31,$D4,$FB,$13,$FD,$01,$00,$10,$20,$20,$19
	.byte $B2,$FE,$92,$F7,$01,$00,$10,$20,$20,$19,$FA,$FE,$52,$F7,$01,$00
V_7A00: .byte $10,$52,$20,$19,$FD,$FE,$55,$F7,$01,$00,$10,$52,$60,$19,$55,$F7
	.byte $FD,$FE,$01,$00,$10,$20,$60,$19,$52,$F7,$FA,$FE,$01,$E3,$0C,$30
	.byte $28,$31,$E3,$FE,$13,$F7,$05,$00,$10,$10,$00,$11,$05,$FB,$35,$FE
	.byte $37,$FB,$17,$F7,$11,$FD,$01,$F7,$03,$00,$0C,$40,$00,$11,$5A,$00
	.byte $45,$FB,$5A,$00,$44,$FD,$02,$00,$10,$20,$20,$19,$FA,$FE,$5A,$F7
	.byte $32,$00,$01,$01,$01,$01,$01,$01,$11,$9F,$9D,$A1,$00,$00,$00,$78
	.byte $11,$A0,$9E,$A7,$00,$00,$00,$78,$01,$01,$01,$01,$01,$01,$01,$01
.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00
V_7A80: .byte $95,$DF,$FF,$9F,$FF,$FF,$97,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$9F,$9F
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$D7
	.byte $48,$FF,$FF,$FF,$FF,$FF,$FF,$DF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$91,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$68,$00,$00,$07,$07
.byte $07,$06,$06,$05,$04,$04,$03,$03,$03,$03,$04,$04,$05,$06,$0F,$0E
V_7B00: .byte $0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$01
.byte $02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$07,$07
.byte $06,$06,$05,$05,$04,$04,$03,$03,$02,$02,$01,$01,$00,$00,$00,$00
.byte $01,$01,$02,$02,$03,$03,$04,$04,$05,$05,$06,$06,$07,$07,$00,$00
	.byte $00,$01,$01,$02,$02,$03,$03,$04,$05,$06,$07,$08,$09,$0B,$0F,$0F
.byte $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01
.byte $03,$04,$05,$06,$06,$07,$07,$06,$06,$05,$04,$03,$01,$00,$07,$07
.byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$07
.byte $06,$06,$05,$05,$04,$04,$04,$04,$05,$05,$06,$06,$07,$07,$07,$07
.byte $06,$05,$04,$04,$03,$03,$03,$03,$04,$04,$05,$06,$07,$07,$00,$00
.byte $01,$01,$02,$02,$03,$03,$03,$03,$02,$02,$01,$01,$00,$00,$0B,$09
.byte $08,$07,$06,$05,$04,$03,$02,$02,$01,$01,$01,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$08,$00
V_7C00: .byte $00
V_7C01: .byte $00
V_7C02: .byte $00
V_7C03: .byte $00
V_7C04: .byte $00
V_7C05: .byte $00
V_7C06: .byte $00,$00,$00
V_7C09: .byte $00
V_7C0A: .byte $00
V_7C0B: .byte $00
V_7C0C: .byte $00
V_7C0D: .byte $00
V_7C0E: .byte $00
V_7C0F: .byte $00
V_7C10: .byte $00,$00
V_7C12: .byte $00
V_7C13: .byte $00
V_7C14: .byte $00
V_7C15: .byte $00
V_7C16: .byte $00
V_7C17: .byte $00
V_7C18: .byte $00
V_7C19: .byte $00,$00
V_7C1B: .byte $00
V_7C1C: .byte $00
V_7C1D: .byte $00,$00,$00,$00,$00
V_7C22: .byte $00
V_7C23: .byte $00
V_7C24: .byte $00,$00
V_7C26: .byte $00
V_7C27: .byte $00
V_7C28: .byte $00
V_7C29: .byte $00
V_7C2A: .byte $00
V_7C2B: .byte $00,$00,$00
V_7C2E: .byte $00
V_7C2F: .byte $00
V_7C30: .byte $00
V_7C31: .byte $00
V_7C32: .byte $00
V_7C33: .byte $00
V_7C34: .byte $00
V_7C35: .byte $00
V_7C36: .byte $00
V_7C37: .byte $00
V_7C38: .byte $00
V_7C39: .byte $00
V_7C3A: .byte $00
V_7C3B: .byte $00
V_7C3C: .byte $00
V_7C3D: .byte $00
V_7C3E: .byte $00
V_7C3F: .byte $00
V_7C40: .byte $00
V_7C41: .byte $00
V_7C42: .byte $00
V_7C43: .byte $00
V_7C44: .byte $00
V_7C45: .byte $00,$00
V_7C47: .byte $00
V_7C48: .byte $00
V_7C49: .byte $00,$00,$00,$00
VAR_BROTHER_INDEX:
	.byte $00
V_7C4E: .byte $00
V_7C4F: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00
V_7C58: .byte $00
V_7C59: .byte $00
V_7C5A: .byte $00
V_7C5B: .byte $00
V_7C5C: .byte $00
V_7C5D: .byte $00
V_7C5E: .byte $00
V_7C5F: .byte $00
V_7C60: .byte $00
V_7C61: .byte $00
V_7C62: .byte $00
V_7C63: .byte $00,$00,$00
V_7C66: .byte $00
V_7C67: .byte $00

VAR_CRUSH_VALUE:
	.byte $00  // 7C68
V_7C69: .byte $00
V_7C6A: .byte $00
V_7C6B: .byte $00
V_7C6C: .byte $00
V_7C6D: .byte $00
V_7C6E: .byte $00
V_7C6F: .byte $00
V_7C70: .byte $00
V_7C71: .byte $00
V_7C72: .byte $00
V_7C73: .byte $00
V_7C74: .byte $00
V_7C75: .byte $00
V_7C76: .byte $00
V_7C77: .byte $00
V_7C78: .byte $00
V_7C79: .byte $00
V_7C7A: .byte $00
V_7C7B: .byte $00
V_7C7C: .byte $00,$00
V_7C7E: .byte $00
V_7C7F: .byte $00
V_7C80: .byte $00
V_7C81: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_7C8B: .byte $00
V_7C8C: .byte $00,$00,$00,$00,$00,$00
V_7C92: .byte $00
V_7C93: .byte $00,$00,$00
V_7C96: .byte $00,$00,$00,$00
V_7C9A: .byte $00,$00
V_7C9C: .byte $00,$00,$00,$00,$00,$00
V_7CA2: .byte $00,$00,$00,$00,$00,$00,$00
V_7CA9: .byte $00
V_7CAA: .byte $00,$00,$00,$00,$00,$00
V_7CB0: .byte $00
V_7CB1: .byte $00,$00,$00
V_7CB4: .byte $00,$00,$00,$00
V_7CB8: .byte $00,$00
V_7CBA: .byte $00,$00,$00,$00,$00,$00
V_7CC0: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_7CCA: .byte $00
V_7CCB: .byte $00
V_7CCC: .byte $00
V_7CCD: .byte $00,$00,$00,$00,$00,$00
V_7CD3: .byte $00
V_7CD4: .byte $00,$00,$00
V_7CD7: .byte $00,$00,$00,$00
V_7CDB: .byte $00,$00,$00,$00,$00,$00,$00,$00
V_7CE3: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_7D00: .byte $00,$00,$00,$00,$00,$00,$00
V_7D07: .byte $00
TAB_BROTHER_DIED:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_7D18: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00
V_7D2C: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00
V_7D8E: .byte $96
V_7D8F: .byte $00
V_7D90: .byte $01
V_7D91: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00
V_7DF4: .byte $00
V_7DF5: .byte $00
V_7DF6: .byte $00
V_7DF7: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00
V_7E00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
V_7E16: .byte $00
V_7E17: .byte $00
V_7E18: .byte $00,$00,$64,$20,$FF,$00,$FF,$79,$FF,$00,$FF,$FB,$FF,$00,$A6,$00
	.byte $FF,$09,$FB,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$04,$08
	.byte $FB,$00,$EB,$00,$FE,$80,$84,$04,$FF,$00,$FF,$00,$FF,$00,$FB,$00
	.byte $FB,$00,$FB,$00,$FF,$00,$FF,$19,$FF,$00,$FF,$00,$FF,$00,$FF,$00
	.byte $FF,$00,$57,$04,$FF,$80,$FF,$DB,$FF,$08,$FF,$00,$FF,$00,$FF,$00
	.byte $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$9B,$FF,$82,$FF,$00,$FF,$9B
	.byte $04,$00,$C0,$80,$A4,$80,$E8,$04,$00,$F7,$00,$FF,$00,$FF,$00,$FB
	.byte $00,$EE,$00,$FF,$00,$FF,$00,$64,$00,$FF,$00,$FF,$00,$FF,$00,$5F
	.byte $00,$FF,$AC,$97,$88,$96,$FD,$96,$84,$80,$FF,$80,$7B,$81,$2A,$82
	.byte $A6,$82,$14,$83,$4F,$83,$88,$83,$B6,$83,$04,$84,$97,$84,$D3,$84
	.byte $4C,$85,$8B,$85,$C4,$85,$03,$86,$4A,$86,$9B,$86,$F6,$86,$13,$87
	.byte $7F,$87,$AA,$87,$F1,$87,$7D,$88,$C0,$88,$02,$89,$75,$89,$EF,$89
	.byte $0E,$8A,$95,$8A,$23,$8B,$B2,$8B,$2D,$8C,$60,$8C,$9D,$8C,$24,$8D
	.byte $44,$8D,$79,$8D,$AE,$8D,$F4,$8D,$06,$8E,$18,$8E,$2B,$8E,$3D,$8E
	.byte $4F,$8E,$63,$8E,$76,$8E,$88,$8E

V_7F00: .byte $9A,$8E,$BA,$8E,$CC,$8E,$EE,$8E,$00,$8F,$1A,$8F,$2C,$8F,$39,$8F
	.byte $57,$8F,$69,$8F,$81,$8F,$94,$8F,$A0,$8F,$B2,$8F,$C5,$8F,$D7,$8F
	.byte $E9,$8F,$FB,$8F,$17,$90,$29,$90,$3B,$90,$4D,$90,$66,$90,$86,$90
	.byte $9F,$90,$B1,$90,$C3,$90,$D5,$90,$F5,$90,$07,$91,$19,$91,$2D,$91
	.byte $3F,$91,$51,$91,$63,$91,$75,$91,$90,$91,$A2,$91,$B4,$91,$D4,$91
	.byte $E5,$91,$EC,$91,$F3,$91,$FA,$91,$01,$92,$0A,$92,$11,$92,$1A,$92
	.byte $21,$92,$28,$92,$31,$92,$39,$92,$43,$92,$4A,$92,$51,$92,$58,$92
	.byte $60,$92,$68,$92,$6F,$92,$76,$92,$7D,$92,$84,$92,$8B,$92,$94,$92
	.byte $9F,$92,$A6,$92,$AD,$92,$B7,$92,$BE,$92,$C8,$92,$CF,$92,$D6,$92
	.byte $DD,$92,$E4,$92,$ED,$92,$F4,$92,$FB,$92,$04,$93,$0B,$93,$12,$93
	.byte $19,$93,$23,$93,$2A,$93,$31,$93,$39,$93,$40,$93,$48,$93,$4F,$93
	.byte $56,$93,$5D,$93,$64,$93,$6B,$93,$73,$93,$7A,$93,$83,$93,$8A,$93
	.byte $93,$93,$9B,$93,$A2,$93,$AB,$93,$B2,$93,$BA,$93,$C1,$93,$C1,$93
	.byte $CB,$93,$D3,$93,$DA,$93,$E3,$93,$EB,$93,$F3,$93,$FA,$93,$03,$94
	.byte $0D,$94,$17,$94,$1E,$94,$25,$94,$2D,$94,$36,$94,$3D,$94,$45,$94
	.byte $4C,$94,$53,$94,$5A,$94,$62,$94,$6B,$94,$74,$94,$7C,$94,$83,$94

	.byte $8A,$94,$91,$94,$99,$94,$A0,$94,$A7,$94,$AF,$94,$B7,$94,$BF,$94
	.byte $CA,$94,$D2,$94,$D9,$94,$E0,$94,$E7,$94,$EF,$94,$F6,$94,$FD,$94
	.byte $04,$95,$0C,$95,$13,$95,$1A,$95,$23,$95,$2A,$95,$31,$95,$38,$95
	.byte $40,$95,$48,$95,$4F,$95,$58,$95,$60,$95,$69,$95,$73,$95,$7C,$95
	.byte $83,$95,$8A,$95,$91,$95,$98,$95,$9F,$95,$A7,$95,$AE,$95,$B5,$95
	.byte $BC,$95,$C5,$95,$CE,$95,$D5,$95,$DC,$95,$E4,$95,$EB,$95,$F3,$95
	.byte $FA,$95,$01,$96,$09,$96,$10,$96,$19,$96,$20,$96,$28,$96,$2F,$96
	.byte $37,$96,$3E,$96,$48,$96,$4F,$96,$56,$96,$60,$96,$6A,$96,$71,$96
	.byte $78,$96,$81,$96,$00,$FB,$05,$0A,$17,$FB,$0A,$0A,$17,$FB,$0D,$0A
	.byte $17,$FB,$10,$FE,$0A,$17,$02,$0A,$13,$FE,$0A,$17,$06,$FB,$1A,$0A
	.byte $17,$FB,$1D,$0A,$17,$FB,$1F,$FE,$0A,$17,$06,$0A,$13,$FE,$0A,$17
	.byte $02,$FB,$2A,$0A,$17,$FB,$2D,$FE,$0A,$17,$03,$FB,$32,$0A,$17,$FB
	.byte $48,$FD,$12,$03,$08,$05,$05,$FB,$50,$12,$16,$FB,$55,$0A,$1B,$FB
	.byte $62,$0A,$1B,$FB,$67,$12,$19,$FB,$6D,$FE,$12,$02,$02,$12,$0F,$FF
	.byte $04,$20,$9F,$E9,$11,$C4,$50,$32,$10,$05,$11,$C7,$7D,$17,$82,$02
	.byte $31,$19,$84,$05,$F1,$01,$11,$1C,$59,$00,$01,$02,$00,$00,$68,$00

	.byte $FB,$01,$FE,$0A,$1F,$02,$0A,$17,$FB,$08,$0A,$18,$FB,$0B,$0A,$17
	.byte $FB,$10,$0A,$18,$FB,$13,$0A,$17,$FB,$18,$FD,$0A,$05,$17,$1F,$1F
	.byte $17,$1F,$FE,$0A,$1F,$02,$0A,$17,$FB,$23,$0A,$17,$FB,$2B,$0A,$17
	.byte $FB,$33,$0A,$18,$FB,$3B,$0A,$17,$FB,$40,$12,$16,$FB,$43,$12,$1C
	.byte $FB,$4B,$12,$02,$FB,$53,$12,$17,$FB,$58,$12,$1E,$FB,$63,$12,$97
	.byte $FB,$6B,$12,$85,$FB,$93,$1A,$02,$FB,$A3,$1A,$85,$FF,$04,$58,$9F
	.byte $05,$11,$BA,$44,$3B,$10,$3A,$11,$C8,$8D,$1F,$82,$08,$31,$28,$8C
	.byte $43,$F1,$02,$11,$36,$44,$00,$06,$00,$00,$78,$00,$FB,$03,$12,$03
	.byte $0A,$17,$FB,$0B,$12,$03,$0A,$17,$FB,$10,$FE,$22,$03,$03,$12,$03
	.byte $0A,$17,$FB,$17,$0A,$17,$FE,$12,$03,$04,$0A,$17,$FB,$20,$12,$17
	.byte $0A,$17,$12,$84,$FE,$0A,$17,$05,$FE,$0A,$13,$04,$0A,$17,$FE,$0A
	.byte $13,$07,$0A,$17,$FE,$0A,$13,$07,$0A,$17,$FE,$0A,$13,$03,$FB,$43
	.byte $22,$03,$FB,$4B,$22,$03,$FB,$50,$FE,$32,$17,$03,$22,$03,$FB,$57
	.byte $12,$00,$FB,$5B,$22,$01,$22,$97,$FB,$80,$32,$03,$3A,$03,$3A,$17
	.byte $32,$03,$3A,$17,$FB,$88,$FE,$3A,$03,$02,$FE,$32,$03,$02,$FB,$90
	.byte $FD,$3A,$03,$17,$03,$17,$32,$03,$3A,$97,$FB,$C2,$3A,$1B,$FB,$CB

	.byte $42,$97,$FF,$05,$20,$9F,$3D,$11,$C5,$49,$3C,$10,$3C,$11,$B8,$94
	.byte $27,$62,$04,$11,$38,$94,$04,$C9,$03,$11,$2C,$51,$84,$C2,$50,$19
	.byte $29,$2B,$00,$03,$04,$05,$00,$04,$00,$78,$00,$FB,$1B,$3A,$13,$0A
	.byte $03,$FB,$23,$3A,$13,$0A,$03,$FB,$28,$FE,$3A,$13,$04,$FB,$2D,$FD
	.byte $0A,$03,$08,$05,$0E,$2A,$03,$22,$03,$1A,$03,$12,$03,$0A,$13,$0A
	.byte $04,$02,$17,$0A,$01,$2A,$04,$22,$04,$1A,$04,$12,$04,$FD,$0A,$04
	.byte $17,$0D,$02,$0F,$FB,$5C,$1A,$03,$FB,$64,$1A,$03,$FB,$6C,$12,$03
	.byte $FB,$71,$32,$17,$2A,$03,$22,$03,$FB,$9C,$2A,$03,$FB,$A4,$2A,$03
	.byte $FB,$AC,$22,$03,$FB,$B3,$32,$17,$FB,$EC,$32,$17,$FF,$03,$30,$1F
	.byte $07,$21,$E5,$39,$38,$3F,$07,$10,$F1,$48,$9C,$F1,$32,$11,$5C,$41

//;db $00,$0A,$00,$08,$00,$68,$00,$FB,$01,$0A,$13,$FE,$0A,$1F,$03,$FE
	.byte $00,$0A,$00,$02,$00,$68,$00,$FB,$01,$0A,$13,$FE,$0A,$1F,$03,$FE

	.byte $0A,$13,$03,$FB,$09,$0A,$18,$FB,$0E,$0A,$13,$0A,$04,$FB,$11,$0A
	.byte $13,$FE,$0A,$1F,$03,$FE,$0A,$13,$02,$FB,$1D,$0A,$18,$FB,$20,$FE
	.byte $0A,$13,$06,$FB,$33,$FD,$12,$03,$08,$05,$0E,$FB,$3B,$12,$04,$02
	.byte $03,$12,$01,$FB,$45,$12,$01,$12,$17,$FB,$63,$0A,$1D,$FB,$86,$1A
	.byte $01,$12,$03,$FF,$04,$20,$9F,$08,$29,$C5,$51,$3C,$10,$09,$11,$B8

	.byte $94,$0F,$E2,$06,$2F,$0A,$81,$87,$C2,$06,$39,$00,$5D,$00,$09,$04
	.byte $01,$00,$00,$78,$00,$FB,$20,$FE,$0A,$03,$08,$FB,$5B,$FE,$1A,$05
	.byte $02,$FB,$60,$FE,$1A,$03,$03,$FE,$12,$1D,$02,$FE,$1A,$83,$03,$FB
	.byte $6B,$FE,$1A,$02,$02,$FB,$A0,$FE,$2A,$17,$03,$FF,$02,$A0,$7F,$04
	.byte $11,$C5,$31,$67,$82,$07,$11,$3A,$8B,$00,$00,$05,$06,$00,$68,$00
	.byte $FB,$04,$0A,$17,$FB,$0C,$0A,$13,$FB,$14,$0A,$13,$FB,$1B,$14,$08
	.byte $0A,$13,$14,$8E,$FB,$20,$0A,$17,$FE,$0A,$13,$04,$14,$81,$FB,$2B
	.byte $FD,$14,$03,$8D,$82,$8F,$FF,$02,$20,$9F,$0A,$11,$C5,$51,$04,$F1
	.byte $07,$11,$2C,$51,$00,$00,$00,$78,$00,$FB,$1B,$FD,$14,$03,$0F,$17
	.byte $0D,$FB,$20,$0A,$17,$FE,$0A,$13,$06,$0A,$17,$FB,$2B,$FD,$14,$03
	.byte $8E,$97,$88,$FF,$02,$20,$9F,$3A,$11,$C5,$51,$27,$82,$09,$11,$38
	.byte $94,$00,$0B,$00,$00,$68,$00,$FB,$04,$0A,$17,$FB,$0C,$0A,$13,$FB
	.byte $14,$0A,$13,$FB,$1B,$14,$0F,$0A,$13,$14,$8D,$FB,$20,$0A,$17,$FE
	.byte $0A,$13,$06,$0A,$17,$FB,$2B,$14,$8E,$0A,$13,$14,$88,$FB,$34,$0A
	.byte $13,$FB,$3C,$0A,$17,$FF,$04,$20,$9F,$0C,$11,$C5,$51,$3C,$10,$0F
	.byte $11,$B7,$95,$27,$82,$3D,$11,$39,$95,$04,$F1,$EA,$11,$2C,$51,$00

	.byte $04,$00,$00,$78,$00,$FB,$0A,$0A,$03,$FB,$0D,$0A,$03,$FB,$12,$0A
	.byte $03,$FB,$15,$0A,$03,$FB,$1A,$0A,$17,$FB,$1D,$0A,$17,$FB,$20,$FE
	.byte $0A,$17,$08,$FB,$2A,$0A,$17,$FB,$2D,$0A,$17,$FB,$4A,$1A,$17,$FB
	.byte $4D,$1A,$17,$FB,$52,$1A,$05,$FB,$55,$1A,$05,$FB,$5A,$12,$05,$FB
	.byte $5D,$12,$05,$FB,$62,$0A,$1D,$FB,$65,$0A,$1D,$FB,$6A,$12,$02,$FB
	.byte $6D,$12,$02,$FB,$72,$0A,$03,$FB,$75,$0A,$03,$FB,$7A,$0A,$03,$FB
	.byte $7D,$0A,$03,$FB,$8A,$22,$06,$FB,$8D,$22,$06,$FB,$B2,$1A,$02,$FB
	.byte $B5,$1A,$02,$FB,$BA,$1A,$17,$FB,$BD,$1A,$17,$FB,$FA,$22,$0B,$FB
	.byte $FD,$22,$0B,$FF,$02,$20,$9F,$0D,$11,$C5,$51,$27,$82,$0B,$11,$39
	.byte $93,$03,$05,$00,$00,$00,$68,$00,$FB,$1B,$FD,$14,$03,$0F,$17,$0D
	.byte $FB,$20,$0A,$17,$FE,$0A,$13,$06,$0A,$17,$FB,$2B,$14,$8E,$0A,$13
	.byte $14,$88,$FB,$34,$0A,$13,$FB,$3C,$0A,$17,$FF,$03,$20,$9F,$F3,$11
	.byte $C5,$51,$3C,$10,$E8,$11,$B7,$95,$27,$82,$0C,$11,$39,$94,$00,$08
	.byte $00,$00,$78,$00,$FB,$14,$FE,$02,$02,$02,$02,$1E,$FB,$1B,$34,$05
	.byte $0B,$03,$0A,$02,$02,$04,$FB,$23,$24,$17,$0B,$03,$0A,$17,$02,$04
	.byte $FB,$2A,$02,$01,$FE,$0A,$03,$02,$FB,$2E,$02,$04,$FB,$32,$02,$1C

	.byte $FE,$02,$05,$03,$02,$16,$FB,$5C,$1C,$03,$FB,$63,$2C,$05,$1C,$03
	.byte $12,$02,$FB,$6B,$18,$03,$18,$17,$0A,$03,$FB,$9C,$2D,$0A,$FB,$A4
	.byte $2D,$83,$FB,$AB,$27,$04,$1F,$04,$1A,$02,$FB,$DC,$39,$01,$41,$01
	.byte $FB,$E4,$46,$83,$46,$82,$FB,$ED,$4E,$82,$FF,$02,$ED,$74,$41,$11
	.byte $88,$94,$1D,$F1,$3C,$11,$46,$7A,$00,$00,$00,$78,$00,$FB,$04,$0A
	.byte $17,$FB,$0C,$0A,$13,$FB,$14,$0A,$13,$FB,$1B,$14,$0F,$0A,$13,$14
	.byte $8D,$FB,$23,$14,$17,$0A,$13,$14,$97,$FB,$2B,$14,$0E,$0A,$13,$14
	.byte $88,$FB,$34,$0A,$13,$FB,$3C,$0A,$17,$FF,$02,$3C,$10,$E7,$11,$B7
	.byte $94,$04,$F1,$0B,$11,$2B,$51,$00,$00,$00,$68,$00,$FB,$04,$0A,$17
	.byte $FB,$0C,$0A,$13,$FB,$14,$0A,$13,$FB,$1B,$14,$08,$0A,$13,$14,$8E
	.byte $FB,$23,$14,$04,$FE,$0A,$13,$03,$0A,$17,$FB,$2B,$FD,$14,$03,$0D
	.byte $02,$8F,$FF,$02,$27,$82,$E8,$11,$38,$94,$04,$F1,$F3,$11,$2A,$51
	.byte $00,$00,$00,$78,$00,$FB,$04,$0A,$17,$FB,$0C,$0A,$13,$FB,$14,$0A
	.byte $13,$FB,$1B,$14,$0F,$0A,$13,$14,$8D,$FB,$20,$0A,$17,$FE,$0A,$13
	.byte $06,$0A,$17,$FB,$2B,$FD,$14,$03,$8E,$97,$88,$FF,$03,$20,$9F,$C7
	.byte $11,$C5,$51,$27,$82,$C8,$11,$39,$94,$04,$F1,$D0,$11,$2C,$51,$00

	.byte $00,$00,$78,$00,$FB,$04,$0A,$17,$FB,$0C,$0A,$13,$FB,$14,$0A,$13
	.byte $FB,$1B,$14,$0F,$0A,$13,$14,$8D,$FB,$20,$0A,$17,$FE,$0A,$13,$04
	.byte $14,$97,$FB,$2B,$14,$8E,$0A,$13,$14,$88,$FB,$34,$0A,$13,$FB,$3C
	.byte $0A,$17,$FF,$03,$20,$9F,$CA,$11,$C5,$51,$3C,$10,$E0,$11,$B7,$94
	.byte $04,$F1,$DF,$11,$2C,$51,$00,$00,$00,$78,$00,$FB,$04,$0A,$15,$0A
	.byte $0A,$FB,$0C,$0A,$15,$0A,$0A,$FB,$14,$0A,$15,$0A,$0A,$FB,$1C,$0A
	.byte $15,$0A,$0A,$FB,$20,$FE,$0A,$10,$04,$0A,$07,$0A,$0A,$FB,$28,$FE
	.byte $0A,$0C,$04,$0A,$1E,$0A,$0A,$FB,$34,$0A,$15,$0A,$0A,$FB,$3C,$0A
	.byte $15,$0A,$0A,$FF,$03,$20,$9F,$D3,$11,$D3,$57,$3C,$10,$D2,$11,$C0
	.byte $98,$04,$F1,$1A,$11,$1C,$59,$00,$00,$00,$68,$00,$FB,$03,$FD,$1A
	.byte $04,$03,$15,$0A,$83,$FB,$0B,$FD,$1A,$04,$03,$15,$0A,$83,$FB,$13
	.byte $FD,$1A,$04,$03,$15,$0A,$83,$FB,$1B,$FD,$1A,$04,$03,$15,$0A,$83
	.byte $FB,$23,$FD,$1A,$04,$03,$15,$0A,$83,$FB,$2B,$FD,$1A,$04,$03,$15
	.byte $0A,$83,$FB,$33,$FD,$1A,$04,$03,$15,$0A,$83,$FB,$3B,$FD,$1A,$04
	.byte $03,$15,$0A,$83,$FF,$02,$3C,$10,$16,$21,$AF,$8E,$04,$F1,$8C,$21
	.byte $11,$42,$00,$00,$00,$58,$00,$FB,$20,$FE,$0E,$10,$08,$FE,$0E,$0C

	.byte $08,$FF,$02,$20,$9F,$16,$11,$D3,$54,$27,$82,$7C,$11,$40,$99,$00
	.byte $00,$00,$78,$00,$FB,$03,$FD,$1A,$04,$03,$15,$0A,$83,$FB,$0B,$FD
	.byte $1A,$04,$03,$15,$0A,$83,$FB,$13,$FD,$1A,$04,$03,$15,$0A,$83,$FB
	.byte $1B,$FD,$1A,$03,$03,$15,$0A,$0E,$03,$FB,$20,$FE,$0E,$10,$08,$FE
	.byte $0E,$0C,$08,$FB,$33,$FD,$1A,$03,$83,$95,$0A,$0E,$03,$FB,$3B,$FD
	.byte $1A,$03,$83,$95,$0A,$FB,$5E,$1A,$83,$FB,$76,$1A,$83,$FB,$7E,$1A
	.byte $83,$FF,$04,$20,$9F,$8B,$11,$D4,$54,$3C,$10,$F2,$21,$AE,$8F,$27
	.byte $82,$15,$11,$42,$99,$04,$F1,$14,$21,$17,$42,$00,$00,$00,$68,$00
	.byte $FB,$18,$FE,$12,$10,$08,$FE,$0A,$17,$08,$FE,$12,$0C,$08,$FB,$62
	.byte $FE,$0A,$1D,$04,$FF,$02,$20,$9F,$88,$11,$C5,$51,$27,$82,$81,$11
	.byte $39,$9C,$00,$00,$05,$06,$09,$0A,$00,$70,$00,$FB,$04,$0A,$17,$FB
	.byte $0C,$0A,$13,$FB,$14,$0A,$13,$FB,$1B,$14,$0F,$0A,$13,$14,$8D,$FB
	.byte $23,$14,$17,$FE,$0A,$13,$03,$0A,$17,$FB,$2B,$14,$0E,$0A,$13,$14
	.byte $88,$FB,$34,$0A,$13,$FB,$3C,$0A,$17,$FF,$03,$3C,$10,$85,$11,$B8
	.byte $95,$27,$82,$83,$11,$39,$94,$04,$F1,$86,$11,$2C,$51,$00,$00,$00
	.byte $78,$00,$FB,$04,$0A,$57,$0A,$03,$FB,$0C,$12,$02,$0A,$03,$FB,$13

	.byte $FE,$0A,$03,$03,$FB,$18,$FE,$0A,$17,$0B,$FE,$0A,$13,$03,$FE,$0A
	.byte $17,$05,$FE,$0A,$13,$03,$FE,$0A,$17,$02,$FB,$33,$FE,$0A,$13,$03
	.byte $FB,$3B,$FE,$0A,$17,$03,$FB,$43,$1A,$03,$FB,$45,$1A,$03,$FB,$4B
	.byte $1A,$03,$FB,$4D,$1A,$03,$FB,$53,$FD,$1A,$03,$03,$02,$83,$FB,$58
	.byte $12,$16,$FB,$5F,$12,$1C,$FB,$68,$12,$1E,$FB,$6C,$0A,$1D,$FB,$6F
	.byte $12,$19,$FB,$7B,$12,$1E,$FB,$7D,$12,$19,$FB,$8B,$2A,$0C,$FB,$8D
	.byte $2A,$8C,$FB,$93,$2A,$10,$FB,$95,$2A,$90,$FF,$02,$3C,$10,$26,$11
	.byte $B7,$94,$04,$F1,$B8,$11,$32,$3B,$00,$00,$0B,$00,$70,$00,$FB,$04
	.byte $0A,$15,$0A,$0A,$FB,$0C,$0A,$15,$0A,$0A,$FB,$14,$0A,$15,$0A,$0A
	.byte $FB,$1C,$0A,$15,$0A,$0A,$FB,$24,$0A,$15,$0A,$0A,$FB,$2C,$0A,$15
	.byte $0A,$0A,$FB,$34,$0A,$15,$0A,$0A,$FB,$3C,$0A,$15,$0A,$0A,$FF,$02
	.byte $3C,$10,$13,$11,$C0,$98,$04,$F1,$DD,$11,$1D,$58,$00,$00,$00,$58
	.byte $00,$FB,$04,$0A,$03,$FB,$0C,$0A,$03,$FB,$14,$0A,$17,$FB,$1B,$FD
	.byte $0A,$03,$08,$05,$0E,$FB,$23,$0A,$04,$02,$17,$0A,$01,$FB,$2B,$FD
	.byte $0A,$03,$0D,$02,$0F,$FB,$44,$1A,$17,$FB,$4C,$1A,$05,$FB,$54,$12
	.byte $05,$FB,$84,$22,$05,$FF,$01,$84,$E9,$1C,$26,$2C,$39,$00,$0B,$00

	.byte $00,$50,$00,$FB,$0A,$0A,$03,$FB,$12,$0A,$03,$FB,$1A,$0A,$17,$FB
	.byte $1C,$0A,$17,$FB,$20,$0A,$17,$FE,$0A,$13,$06,$0A,$17,$FB,$2A,$0A
	.byte $17,$FB,$2C,$0A,$17,$FB,$4A,$1A,$17,$FB,$52,$1A,$05,$FB,$5A,$12
	.byte $05,$FB,$5C,$12,$0C,$FB,$6A,$12,$02,$FB,$6C,$12,$90,$FB,$72,$0A
	.byte $03,$FB,$7A,$0A,$03,$FB,$8A,$22,$05,$FB,$B2,$1A,$02,$FB,$BA,$1A
	.byte $17,$FB,$FA,$22,$02,$FF,$04,$20,$9F,$32,$11,$C6,$51,$FA,$10,$1B
	.byte $26,$D6,$6B,$27,$82,$5F,$11,$38,$94,$8A,$E5,$1D,$21,$5B,$31,$03
	.byte $00,$04,$00,$00,$70,$00,$FB,$13,$2A,$57,$FB,$1C,$22,$03,$FB,$22
	.byte $FE,$0A,$03,$06,$FB,$29,$FD,$0A,$04,$03,$08,$05,$0E,$FB,$31,$0A
	.byte $03,$0A,$04,$02,$09,$0A,$01,$FB,$39,$FD,$0A,$04,$03,$0D,$02,$0F
	.byte $FB,$5A,$32,$03,$31,$14,$32,$03,$FB,$61,$FE,$1A,$03,$07,$FB,$69
	.byte $1A,$03,$FB,$71,$1A,$17,$FB,$79,$1A,$05,$FB,$9B,$31,$91,$FB,$A1
	.byte $3A,$16,$FE,$2A,$17,$04,$2A,$04,$FB,$A9,$2A,$06,$FB,$B1,$22,$05
	.byte $FB,$DA,$FE,$42,$03,$03,$FB,$E2,$32,$04,$FF,$02,$79,$28,$1C,$26
	.byte $E7,$74,$67,$82,$2E,$11,$39,$7B,$07,$00,$0D,$00,$0C,$00,$68,$00
	.byte $FE,$0A,$17,$06,$FB,$08,$0A,$17,$FB,$10,$0A,$17,$FB,$42,$FE,$0A

	.byte $1B,$04,$FF,$01,$1E,$78,$00,$11,$A7,$4C,$00,$00,$00,$78,$00,$FB
	.byte $14,$0A,$13,$FB,$18,$22,$03,$FB,$1B,$12,$03,$0A,$13,$FB,$20,$22
	.byte $16,$FE,$12,$03,$03,$0A,$13,$FB,$28,$12,$03,$1A,$04,$FE,$0A,$13
	.byte $03,$0A,$17,$FB,$30,$22,$1E,$0A,$03,$FB,$34,$0A,$17,$FB,$38,$FE
	.byte $0A,$03,$02,$FB,$59,$FE,$22,$03,$03,$FB,$62,$22,$01,$22,$13,$FB
	.byte $6A,$12,$04,$FB,$6D,$12,$01,$FB,$71,$1A,$0D,$FB,$74,$12,$02,$FB
	.byte $78,$FE,$1A,$17,$02,$FB,$98,$4A,$16,$FE,$3A,$03,$05,$FB,$B8,$22
	.byte $0D,$22,$02,$FB,$DD,$4A,$1C,$FB,$E0,$FE,$42,$13,$04,$FB,$E5,$42
	.byte $93,$FF,$02,$E0,$BF,$00,$11,$C6,$19,$14,$F1,$2A,$11,$4B,$61,$00
	.byte $04,$0C,$00,$00,$70,$00,$2A,$08,$2A,$16,$22,$08,$22,$16,$1A,$08
	.byte $1A,$0E,$22,$01,$2A,$01,$2A,$16,$22,$08,$22,$16,$FD,$1A,$03,$13
	.byte $04,$01,$22,$01,$2A,$1C,$22,$08,$22,$16,$FD,$1A,$04,$08,$05,$16
	.byte $01,$FD,$22,$03,$1C,$0E,$16,$1A,$08,$1A,$16,$12,$08,$12,$0E,$1A
	.byte $1C,$1A,$0E,$22,$1C,$1A,$08,$1A,$16,$FD,$12,$04,$08,$16,$1C,$0E
	.byte $FD,$1A,$04,$1C,$0E,$0D,$1E,$FD,$12,$05,$0D,$02,$1E,$1C,$0E,$1A
	.byte $1C,$22,$1E,$FD,$1A,$03,$0D,$02,$1E,$FD,$12,$04,$0D,$1E,$1C,$0E

	.byte $FD,$22,$03,$0D,$02,$1E,$1A,$0D,$1A,$1E,$FD,$12,$03,$0D,$1E,$01
	.byte $FF,$02,$37,$42,$52,$17,$5B,$9C,$20,$BF,$21,$17,$C5,$41,$00,$00
	.byte $07,$00,$70,$00,$1A,$16,$12,$08,$12,$0E,$1A,$01,$22,$1C,$22,$0E
	.byte $2A,$1C,$2A,$0E,$FD,$12,$03,$08,$16,$01,$1A,$1C,$1A,$0E,$22,$1C
	.byte $22,$0E,$2A,$1C,$12,$16,$0A,$13,$12,$1C,$12,$0E,$1A,$1C,$1A,$0E
	.byte $22,$1C,$22,$05,$FE,$12,$02,$02,$FD,$12,$03,$1E,$1C,$0E,$FD,$1A
	.byte $05,$1C,$05,$0E,$02,$1E,$FD,$12,$05,$0D,$1E,$1C,$05,$0E,$1A,$1C
	.byte $22,$1E,$1A,$0D,$1A,$1E,$12,$0D,$12,$1E,$0A,$13,$12,$1C,$12,$0E
	.byte $22,$0D,$22,$1E,$1A,$0D,$1A,$1E,$FD,$12,$04,$0D,$1E,$19,$0F,$2A
	.byte $1E,$22,$0D,$22,$1E,$1A,$0D,$1A,$1E,$12,$0D,$12,$0F,$1A,$19,$FF
	.byte $02,$2F,$82,$20,$1F,$4C,$94,$01,$F1,$22,$11,$5C,$31,$00,$00,$0D
	.byte $00,$50,$00,$FD,$32,$06,$05,$0E,$08,$16,$1C,$16,$FD,$2A,$03,$08
	.byte $0E,$0E,$32,$1C,$32,$16,$FD,$2A,$0A,$13,$08,$05,$16,$1C,$1C,$0E
	.byte $08,$05,$16,$FD,$22,$04,$08,$0E,$13,$0E,$2A,$1C,$2A,$16,$FD,$22
	.byte $09,$08,$05,$16,$1C,$0E,$1C,$05,$05,$16,$FD,$1A,$03,$08,$0E,$13
	.byte $22,$1C,$FD,$1A,$08,$05,$0E,$08,$05,$16,$1C,$05,$05,$12,$13,$1A

	.byte $01,$1A,$04,$FD,$12,$03,$08,$05,$0E,$FD,$1A,$05,$19,$02,$1E,$1C
	.byte $16,$12,$04,$0A,$17,$12,$01,$1A,$01,$22,$19,$FF,$02,$3C,$04,$21
	.byte $17,$B7,$94,$06,$F5,$54,$17,$0C,$41,$00,$00,$00,$58,$00,$FB,$24
	.byte $0A,$12,$FE,$0A,$10,$03,$FB,$2C,$FD,$0A,$03,$15,$19,$8C,$FE,$0A
	.byte $8C,$01,$FB,$34,$0A,$15,$0A,$8A,$FB,$3C,$0A,$15,$0A,$8A,$FF,$02
	.byte $3C,$10,$24,$11,$AE,$9E,$27,$82,$D5,$11,$44,$A1,$00,$00,$00,$58
	.byte $00,$FB,$04,$0A,$15,$0A,$0A,$FB,$0C,$0A,$15,$0A,$0A,$FB,$14,$0A
	.byte $15,$0A,$0A,$FB,$1C,$0A,$15,$0A,$0A,$FB,$20,$FE,$0A,$10,$04,$0A
	.byte $07,$0A,$0A,$FB,$28,$FE,$0A,$0C,$05,$0A,$0F,$FF,$02,$20,$9F,$45
	.byte $11,$D3,$58,$04,$F1,$23,$11,$28,$4F,$00,$00,$00,$68,$00,$FB,$03
	.byte $FD,$0A,$04,$03,$13,$13,$83,$FB,$0A,$0A,$03,$FB,$0C,$12,$85,$0A
	.byte $17,$FB,$12,$0A,$03,$FB,$14,$FE,$0A,$13,$02,$FB,$1A,$0A,$03,$FB
	.byte $1C,$FE,$0A,$13,$02,$FB,$20,$FE,$0A,$17,$03,$FB,$24,$FE,$0A,$17
	.byte $04,$FB,$43,$1A,$03,$FB,$46,$1A,$83,$FB,$4A,$1A,$03,$FB,$4D,$12
	.byte $85,$FB,$52,$1A,$17,$FB,$5A,$1A,$05,$FB,$61,$12,$01,$12,$17,$FB
	.byte $83,$2A,$03,$FB,$86,$2A,$83,$FB,$8A,$2A,$06,$FB,$92,$22,$05,$FB

	.byte $A2,$1A,$19,$FB,$C2,$3A,$16,$FB,$C6,$3A,$81,$FB,$E4,$12,$1E,$FF
	.byte $02,$20,$9F,$2E,$11,$C5,$51,$27,$82,$5D,$11,$39,$94,$00,$10,$11
	.byte $00,$0F,$00,$68,$00,$12,$16,$FE,$0A,$13,$3F,$FB,$47,$12,$1C,$FB
	.byte $78,$12,$1E,$FB,$7F,$12,$19,$FF,$01,$04,$F1,$19,$11,$2D,$51,$00
	.byte $00,$0D,$00,$60,$00,$FB,$1B,$FD,$14,$03,$08,$05,$0E,$FB,$20,$0A
	.byte $17,$FE,$0A,$13,$04,$14,$01,$FB,$2B,$14,$8D,$0A,$13,$14,$8F,$FB
	.byte $34,$0A,$13,$FB,$3C,$0A,$17,$FF,$02,$20,$9F,$28,$11,$C5,$51,$3C
	.byte $10,$CF,$11,$B7,$94,$00,$00,$00,$78,$00,$FB,$1B,$FD,$14,$03,$08
	.byte $05,$0E,$FB,$23,$14,$04,$FE,$0A,$13,$03,$0A,$17,$FB,$2B,$14,$0D
	.byte $0A,$13,$14,$8F,$FB,$34,$0A,$13,$FB,$3C,$0A,$17,$FF,$02,$3C,$10
	.byte $D0,$11,$B7,$94,$27,$82,$27,$11,$3A,$94,$00,$00,$00,$78,$00,$FB
	.byte $18,$FE,$0A,$17,$18,$FB,$58,$12,$16,$FB,$5A,$FD,$12,$04,$0A,$15
	.byte $0A,$15,$FB,$5F,$12,$1C,$FB,$61,$FD,$12,$06,$8A,$95,$8A,$95,$8A
	.byte $95,$FB,$68,$12,$1E,$FB,$6A,$FD,$12,$04,$8A,$95,$8A,$95,$FB,$6F
	.byte $12,$19,$FF,$02,$20,$9F,$5A,$11,$C4,$50,$27,$82,$44,$11,$3A,$94
	.byte $00,$00,$00,$58,$22,$02,$3C,$50,$1F,$11,$B7,$94,$2F,$42,$2B,$17

	.byte $4A,$8F,$00,$00,$00,$58,$21,$02,$10,$BF,$2A,$20,$AC,$41,$2F,$82
	.byte $2C,$20,$4B,$94,$00,$00,$00,$68,$20,$02,$20,$BF,$2B,$17,$CB,$43
	.byte $07,$82,$2D,$11,$FF,$57,$00,$00,$07,$00,$78,$15,$02,$20,$1F,$2C
	.byte $2F,$D3,$54,$27,$82,$F4,$11,$42,$9A,$00,$00,$00,$58,$29,$02,$20
	.byte $9F,$1D,$29,$C3,$50,$27,$82,$25,$11,$3A,$94,$00,$00,$00,$50,$0C
	.byte $02,$20,$7F,$30,$11,$C6,$51,$27,$82,$66,$11,$39,$94,$05,$06,$00
	.byte $00,$00,$70,$04,$02,$3B,$14,$33,$11,$C7,$8C,$1F,$82,$2F,$11,$29
	.byte $8C,$00,$06,$00,$00,$68,$27,$02,$20,$5F,$33,$11,$C6,$51,$00,$10
	.byte $6A,$11,$B7,$94,$00,$00,$00,$68,$01,$02,$3C,$70,$06,$39,$B8,$95
	.byte $27,$82,$1C,$11,$38,$94,$00,$00,$00,$68,$03,$04,$20,$9F,$6E,$11
	.byte $C5,$51,$32,$10,$34,$11,$C7,$7C,$17,$82,$31,$11,$1A,$85,$05,$ED
	.byte $30,$11,$1C,$59,$00,$01,$02,$00,$00,$50,$09,$02,$20,$9F,$6F,$11
	.byte $C5,$51,$04,$C9,$33,$11,$2C,$51,$00,$00,$00,$78,$05,$04,$20,$9F
	.byte $36,$11,$C5,$49,$3C,$10,$6D,$11,$B7,$94,$27,$82,$6B,$11,$38,$94
	.byte $04,$F1,$6A,$11,$2C,$51,$00,$03,$04,$05,$00,$04,$00,$68,$28,$02
	.byte $3C,$10,$37,$31,$B6,$94,$27,$82,$35,$19,$39,$94,$00,$00,$00,$78

	.byte $02,$03,$20,$9F,$38,$11,$C5,$31,$3C,$70,$71,$39,$B6,$94,$84,$F1
	.byte $36,$11,$2B,$31,$00,$00,$01,$02,$00,$68,$10,$02,$27,$82,$37,$31
	.byte $39,$94,$04,$F1,$70,$11,$2A,$52,$00,$00,$00,$78,$20,$01,$3C,$10
	.byte $7E,$21,$B8,$83,$00,$00,$07,$00,$60,$0B,$04,$20,$9F,$3C,$11,$C6
	.byte $51,$3C,$10,$3B,$21,$B7,$94,$27,$82,$0A,$11,$39,$94,$04,$ED,$04
	.byte $11,$2B,$51,$00,$00,$00,$78,$14,$02,$3C,$10,$8C,$21,$AE,$96,$04
	.byte $F1,$3A,$11,$17,$42,$00,$00,$00,$68,$18,$03,$3C,$74,$0E,$11,$B7
	.byte $94,$27,$82,$3A,$11,$38,$94,$04,$F1,$05,$11,$2C,$51,$00,$00,$00
	.byte $78,$0C,$02,$20,$9F,$0B,$11,$C6,$51,$27,$82,$05,$19,$39,$94,$03
	.byte $00,$00,$00,$78,$21,$01,$04,$F1,$F2,$21,$2A,$3B,$00,$00,$00,$50
	.byte $1A,$02,$3C,$10,$80,$11,$AE,$9D,$04,$F1,$F1,$1E,$58,$50,$00,$00
	.byte $00,$68,$19,$02,$27,$82,$86,$11,$3A,$94,$04,$F1,$87,$11,$25,$39
	.byte $00,$00,$0B,$00,$50,$0E,$02,$ED,$10,$42,$11,$89,$94,$1D,$B5,$0E
	.byte $54,$47,$78,$00,$00,$00,$60,$24,$02,$20,$9F,$8D,$11,$D3,$58,$04
	.byte $B5,$41,$54,$1E,$58,$00,$00,$00,$70,$15,$02,$20,$1F,$44,$21,$D4
	.byte $54,$27,$82,$8E,$11,$43,$99,$00,$00,$00,$78,$07,$03,$20,$9F,$29

	.byte $11,$C6,$51,$3C,$10,$94,$11,$B7,$94,$87,$82,$43,$11,$01,$5D,$00
	.byte $09,$01,$02,$04,$00,$00,$60,$15,$02,$20,$9F,$48,$29,$D3,$54,$27
	.byte $82,$24,$11,$43,$99,$00,$00,$00,$68,$23,$02,$3C,$4C,$48,$31,$BE
	.byte $95,$27,$82,$D6,$11,$41,$9D,$00,$00,$00,$68,$0A,$02,$20,$5F,$49
	.byte $11,$C5,$51,$27,$82,$D1,$11,$39,$94,$00,$00,$00,$78,$1D,$03,$79
	.byte $14,$49,$11,$E7,$73,$67,$82,$45,$11,$39,$7B,$13,$F1,$46,$11,$7D
	.byte $29,$00,$0D,$00,$00,$50,$03,$04,$20,$9F,$C6,$11,$C5,$51,$32,$70
	.byte $4A,$39,$C7,$7C,$17,$82,$47,$11,$1A,$84,$05,$E5,$48,$21,$1C,$59
	.byte $00,$01,$04,$00,$00,$60,$06,$03,$30,$1F,$59,$21,$E5,$39,$38,$3F
	.byte $59,$11,$F1,$48,$9C,$C9,$49,$11,$5C,$41,$00,$0A,$00,$00,$58,$27
	.byte $02,$20,$9F,$AD,$11,$C5,$51,$3C,$74,$AB,$11,$B7,$94,$00,$00,$00
	.byte $78,$0E,$02,$ED,$74,$4D,$11,$8A,$94,$1D,$B5,$AB,$54,$48,$79,$00
	.byte $00,$00,$70,$0E,$02,$ED,$28,$4E,$28,$8C,$96,$1D,$B5,$4C,$54,$49
	.byte $78,$00,$00,$00,$78,$1C,$04,$FA,$10,$A8,$28,$D7,$6C,$27,$82,$A0
	.byte $11,$39,$94,$8A,$B5,$4D,$54,$5C,$31,$20,$BF,$4F,$17,$C5,$51,$03
	.byte $00,$0E,$00,$00,$70,$21,$02,$10,$DF,$A9,$15,$A5,$3C,$2F,$82,$4E

	.byte $11,$4A,$94,$00,$00,$00,$78,$22,$02,$30,$13,$05,$41,$E5,$59,$3C
	.byte $04,$AA,$17,$B7,$94,$00,$00,$00,$70,$26,$02,$27,$82,$B3,$11,$39
	.byte $94,$3C,$04,$52,$17,$B6,$94,$00,$00,$00,$78,$00,$78,$21,$02,$01
	.byte $F1,$51,$11,$5B,$32,$10,$BF,$20,$17,$A9,$40,$00,$00,$00,$78,$09
	.byte $02,$20,$BF,$54,$17,$C5,$51,$04,$F1,$B4,$11,$2C,$51,$00,$00,$00
	.byte $78,$21,$02,$3D,$18,$22,$31,$A6,$94,$2F,$82,$53,$11,$4B,$94,$00
	.byte $00,$00,$70,$10,$02,$27,$82,$B8,$11,$3A,$94,$04,$C9,$BA,$11,$2B
	.byte $52,$00,$00,$00,$78,$02,$03,$20,$5F,$BA,$11,$C5,$31,$3C,$10,$B8
	.byte $11,$B6,$94,$84,$F1,$57,$11,$2B,$31,$01,$00,$00,$01,$02,$00,$78
	.byte $1A,$02,$3C,$10,$56,$31,$AD,$9E,$04,$F1,$BF,$11,$1B,$58,$00,$00
	.byte $00,$78,$27,$02,$20,$9F,$BC,$11,$C6,$51,$3C,$14,$BA,$11,$B6,$94
	.byte $00,$00,$00,$78,$07,$04,$3C,$10,$C0,$11,$B7,$94,$20,$9F,$C3,$11
	.byte $C5,$51,$87,$C2,$4A,$39,$FF,$5F,$0F,$E2,$4A,$31,$0B,$82,$00,$0E
	.byte $00,$05,$00,$58,$26,$01,$27,$82,$29,$11,$3B,$94,$00,$04,$01,$02
	.byte $0F,$06,$00,$00,$68,$29,$F4,$5C,$00,$00,$00,$58,$27,$5B,$5D,$00
	.byte $00,$00,$68,$09,$25,$5C,$00,$00,$00,$68,$27,$5F,$62,$00,$00,$00

	.byte $58,$0C,$1C,$5E,$05,$06,$00,$00,$00,$50,$27,$61,$64,$00,$00,$00
	.byte $68,$0C,$62,$60,$03,$00,$0E,$00,$00,$68,$10,$61,$5E,$00,$00,$00
	.byte $58,$27,$64,$65,$00,$00,$00,$78,$18,$66,$63,$60,$00,$08,$00,$00
	.byte $78,$12,$66,$67,$63,$00,$00,$00,$78,$0B,$2F,$68,$65,$64,$00,$0E
	.byte $00,$00,$78,$09,$68,$65,$00,$00,$00,$78,$10,$67,$66,$00,$00,$00
	.byte $78,$27,$6A,$6B,$00,$00,$00,$60,$18,$35,$69,$31,$00,$00,$00,$60
	.byte $12,$35,$6C,$69,$00,$00,$00,$60,$09,$6D,$6B,$00,$00,$00,$70,$10
	.byte $6C,$35,$00,$00,$00,$70,$28,$6F,$33,$00,$00,$00,$78,$10,$34,$6E
	.byte $00,$00,$00,$78,$27,$73,$38,$00,$00,$00,$78,$06,$72,$72,$37,$00
	.byte $0A,$00,$00,$78,$07,$75,$76,$71,$71,$00,$09,$0E,$00,$00,$68,$15
	.byte $74,$70,$00,$00,$00,$68,$15,$7C,$73,$00,$00,$00,$58,$1D,$77,$72
	.byte $07,$00,$0D,$00,$0C,$00,$50,$09,$77,$72,$00,$00,$00,$78,$1C,$79
	.byte $78,$76,$75,$0A,$00,$00,$00,$70,$1B,$77,$00,$04,$00,$00,$68,$15
	.byte $7F,$77,$00,$00,$00,$68,$14,$7F,$7B,$00,$00,$00,$58,$14,$7A,$7C
	.byte $00,$00,$00,$58,$16,$15,$7B,$74,$7D,$00,$00,$00,$78,$14,$7C,$7E
	.byte $00,$00,$00,$58,$14,$7D,$39,$00,$00,$00,$50,$16,$81,$F1,$79,$7A

	.byte $00,$00,$00,$60,$24,$83,$3F,$00,$00,$00,$78,$15,$17,$7F,$00,$00
	.byte $00,$68,$27,$86,$83,$00,$00,$00,$78,$0B,$18,$84,$80,$82,$00,$0E
	.byte $00,$00,$78,$09,$85,$83,$00,$00,$00,$78,$10,$84,$18,$00,$00,$00
	.byte $78,$0D,$40,$18,$82,$00,$00,$00,$78,$0F,$40,$88,$00,$00,$00,$70
	.byte $18,$87,$17,$89,$00,$00,$00,$70,$27,$90,$88,$00,$00,$00,$70,$24
	.byte $8F,$8B,$00,$00,$00,$68,$23,$8A,$16,$00,$00,$00,$68,$14,$14,$3B
	.byte $00,$00,$00,$50,$23,$8E,$42,$00,$00,$00,$70,$13,$43,$8F,$8D,$00
	.byte $00,$00,$70,$10,$8A,$8E,$00,$00,$00,$78,$0D,$92,$91,$89,$00,$0E
	.byte $00,$00,$70,$09,$93,$90,$00,$00,$00,$70,$0D,$95,$93,$90,$00,$08
	.byte $00,$00,$70,$10,$91,$92,$00,$04,$00,$00,$70,$09,$96,$44,$00,$00
	.byte $00,$78,$17,$97,$92,$00,$00,$05,$06,$00,$78,$15,$98,$94,$00,$00
	.byte $00,$78,$0C,$9A,$95,$0A,$00,$00,$00,$78,$28,$9A,$96,$00,$00,$00
	.byte $78,$0B,$A2,$9B,$97,$98,$00,$0B,$00,$00,$68,$19,$9C,$9A,$00,$00
	.byte $0B,$00,$68,$09,$9D,$9B,$00,$00,$00,$78,$0A,$9E,$9C,$00,$04,$01
	.byte $00,$00,$78,$11,$9F,$9D,$A1,$00,$00,$00,$78,$11,$A0,$9E,$A7,$00
	.byte $00,$00,$78,$17,$4E,$9F,$00,$00,$00,$68,$12,$A7,$9E,$A3,$00,$04

	.byte $00,$00,$68,$25,$A3,$9A,$09,$00,$10,$11,$00,$00,$78,$0B,$A6,$A1
	.byte $A2,$A4,$00,$08,$00,$00,$78,$27,$A5,$A3,$00,$00,$00,$78,$28,$A6
	.byte $A4,$00,$00,$00,$78,$18,$A7,$A3,$A5,$00,$00,$00,$78,$18,$9F,$A1
	.byte $A6,$00,$04,$00,$00,$78,$1B,$4E,$00,$0B,$00,$00,$50,$20,$4F,$AA
	.byte $00,$00,$07,$00,$58,$21,$A9,$50,$00,$00,$00,$58,$0E,$4C,$4B,$00
	.byte $00,$00,$58,$09,$AF,$AD,$00,$00,$00,$68,$0D,$AE,$AC,$4B,$00,$00
	.byte $00,$68,$0D,$B1,$AF,$AD,$00,$04,$00,$00,$78,$11,$B0,$AC,$AE,$00
	.byte $0E,$00,$00,$78,$11,$B2,$AF,$B1,$00,$00,$00,$78,$28,$B0,$AE,$00
	.byte $00,$00,$78,$28,$B3,$B0,$00,$00,$00,$78,$09,$51,$B2,$00,$00,$00
	.byte $78,$12,$B5,$53,$B6,$00,$00,$00,$68,$10,$B4,$B7,$00,$00,$00,$68
	.byte $27,$B7,$B4,$00,$00,$00,$68,$18,$B5,$B6,$B9,$00,$00,$00,$58,$12
	.byte $55,$19,$56,$00,$00,$00,$78,$0F,$B7,$BB,$00,$04,$00,$00,$58,$03
	.byte $BB,$55,$56,$58,$00,$01,$02,$00,$00,$78,$18,$B9,$BA,$BC,$00,$00
	.byte $00,$68,$28,$BB,$58,$00,$00,$00,$78,$10,$BE,$C2,$00,$00,$00,$78
	.byte $29,$BD,$BF,$00,$00,$00,$78,$13,$BE,$57,$C0,$00,$00,$00,$70,$1A
	.byte $BF,$59,$00,$00,$00,$70,$09,$C2,$C3,$00,$00,$00,$78,$28,$BD,$C1

	.byte $00,$00,$00,$78,$0D,$C4,$C1,$59,$00,$00,$00,$70,$10,$C3,$C5,$00
	.byte $00,$00,$70,$28,$C4,$F0,$00,$00,$00,$70,$0C,$F0,$49,$0A,$04,$00
	.byte $00,$00,$68,$10,$11,$D1,$00,$00,$00,$78,$09,$11,$CF,$00,$00,$00
	.byte $78,$10,$CA,$CC,$00,$00,$00,$78,$11,$C9,$12,$CB,$00,$00,$00,$78
	.byte $0F,$CA,$CD,$00,$0E,$00,$00,$78,$0F,$C9,$CE,$00,$00,$00,$78,$0B
	.byte $CE,$CB,$DE,$D2,$00,$00,$00,$78,$0D,$CF,$CC,$CD,$00,$00,$00,$78
	.byte $0B,$D0,$C8,$CE,$27,$00,$00,$00,$78,$0B,$D1,$11,$CF,$28,$00,$08
	.byte $00,$00,$68,$0D,$47,$C7,$D0,$00,$04,$00,$00,$78,$1A,$CD,$13,$00
	.byte $00,$00,$58,$15,$D4,$13,$00,$00,$00,$68,$15,$D5,$D3,$00,$00,$00
	.byte $58,$15,$23,$D4,$00,$00,$00,$58,$24,$46,$D7,$00,$00,$00,$68,$19
	.byte $D6,$D8,$00,$00,$0B,$00,$68,$23,$D7,$D9,$00,$00,$00,$58,$15,$D8
	.byte $DA,$00,$00,$00,$68,$15,$D9,$DB,$00,$00,$00,$78,$25,$DA,$DC,$00
	.byte $10,$11,$00,$00,$60,$0C,$DB,$DD,$06,$00,$00,$0A,$00,$78,$27,$DC
	.byte $1A,$00,$00,$00,$68,$27,$CD,$DF,$00,$00,$00,$78,$18,$12,$EF,$DE
	.byte $00,$00,$00,$78,$10,$E1,$12,$00,$00,$00,$68,$0D,$E0,$E2,$F3,$00
	.byte $00,$00,$68,$0F,$E3,$E1,$00,$00,$00,$68,$10,$E4,$E2,$00,$00,$00

	.byte $68,$0A,$E3,$E5,$00,$0E,$00,$00,$58,$0A,$E4,$E6,$00,$00,$00,$68
	.byte $0A,$E5,$E7,$00,$04,$01,$00,$00,$68,$09,$E6,$0F,$00,$00,$00,$78
	.byte $09,$10,$0D,$00,$0E,$00,$00,$78,$0A,$EA,$03,$00,$00,$00,$58,$0D
	.byte $EB,$0B,$E9,$00,$00,$00,$68,$0A,$EC,$EA,$00,$00,$00,$68,$25,$ED
	.byte $EB,$00,$10,$11,$00,$0F,$00,$78,$10,$EC,$EE,$00,$00,$00,$78,$27
	.byte $EF,$ED,$00,$00,$00,$78,$17,$DF,$EE,$00,$04,$01,$00,$0A,$00,$68
	.byte $25,$C5,$C6,$00,$10,$11,$00,$0F,$00,$50,$14,$3F,$7F,$00,$00,$00
	.byte $78,$14,$3E,$16,$00,$00,$00,$68,$0D,$E1,$10,$0D,$00,$04,$00,$00
	.byte $78,$29,$2D,$5B,$00,$00,$00,$68,$00,$FB,$1B,$FE,$0A,$17,$03,$FE
	.byte $0E,$03,$02,$FB,$23,$FE,$0A,$17,$05,$FB,$2B,$FE,$0A,$17,$05,$FB
	.byte $33,$0E,$03,$FE,$0A,$17,$04,$FB,$3B,$0E,$03,$FE,$0A,$17,$04,$FB
	.byte $5B,$FE,$1E,$17,$05,$FB,$63,$1E,$17,$FD,$12,$03,$12,$10,$07,$FB
	.byte $6B,$1E,$17,$12,$15,$FB,$73,$1E,$17,$12,$07,$FB,$7B,$1E,$17,$FB
	.byte $7F,$12,$19,$FB,$9B,$26,$17,$FE,$26,$1F,$04,$FB,$A3,$26,$18,$FB
	.byte $AB,$26,$18,$FB,$B3,$26,$18,$FB,$BB,$26,$18,$FF,$02,$3C,$14,$03
	.byte $11,$B7,$94,$27,$82,$00,$11,$39,$94,$00,$00,$00,$68,$00,$FE,$32

	.byte $17,$04,$12,$03,$FB,$08,$FE,$32,$17,$04,$12,$03,$FB,$10,$FE,$32
	.byte $17,$03,$2A,$17,$1A,$03,$12,$03,$0A,$03,$FB,$18,$FE,$2A,$03,$04
	.byte $1A,$03,$12,$03,$0A,$03,$FB,$20,$FE,$2A,$17,$04,$FE,$12,$03,$02
	.byte $0A,$17,$FB,$28,$FE,$0A,$03,$04,$12,$07,$FE,$0A,$13,$03,$FB,$34
	.byte $FE,$0A,$13,$04,$FB,$3C,$FE,$0A,$13,$04,$FB,$44,$22,$00,$FB,$56
	.byte $1A,$17,$FB,$5B,$32,$97,$FB,$5E,$1A,$05,$FB,$63,$32,$80,$FB,$66
	.byte $12,$05,$FB,$68,$FE,$1A,$03,$04,$FB,$84,$2A,$17,$FB,$8C,$2A,$17
	.byte $FB,$94,$2A,$17,$FB,$9D,$22,$02,$FB,$A4,$FE,$22,$17,$02,$FB,$A8
	.byte $FE,$2A,$13,$04,$FB,$DC,$2A,$05,$FB,$E8,$2A,$1B,$FB,$EB,$2A,$1B
	.byte $FF,$03,$20,$5F,$03,$11,$C5,$31,$3C,$0C,$04,$11,$B8,$94,$84,$ED
	.byte $00,$11,$2C,$31,$01,$00,$00,$01,$02,$03,$00,$70,$00,$32,$05,$32
	.byte $0E,$12,$03,$0A,$57,$1A,$03,$22,$05,$22,$0E,$0A,$03,$2A,$0E,$32
	.byte $01,$12,$03,$11,$14,$12,$03,$1A,$0E,$22,$01,$0A,$03,$2A,$1C,$1A
	.byte $03,$12,$04,$0A,$17,$12,$01,$1A,$1C,$1A,$05,$0A,$03,$FE,$12,$03
	.byte $02,$12,$16,$0A,$17,$FD,$12,$03,$1C,$05,$0E,$0A,$03,$FE,$0A,$17
	.byte $18,$FE,$0A,$03,$02,$FE,$0A,$17,$06,$FB,$42,$32,$17,$FE,$2A,$03

	.byte $02,$FB,$47,$1A,$03,$FB,$4A,$22,$03,$2A,$03,$22,$03,$FB,$4F,$1A
	.byte $03,$FB,$51,$2A,$05,$FB,$57,$1A,$0E,$FE,$22,$05,$02,$FB,$5F,$1A
	.byte $1C,$FB,$66,$FD,$12,$04,$1C,$05,$02,$1E,$FB,$70,$1A,$1E,$12,$0D
	.byte $12,$1E,$FB,$74,$12,$19,$12,$1E,$FB,$77,$12,$19,$1A,$0D,$1A,$1E
	.byte $12,$04,$FB,$7C,$FD,$12,$04,$01,$0D,$02,$0F,$FB,$87,$2A,$01,$FB
	.byte $8A,$32,$17,$2A,$03,$32,$17,$FB,$8F,$2A,$01,$FB,$CB,$11,$91,$FF
	.byte $03,$20,$9F,$01,$11,$C5,$51,$3B,$10,$02,$31,$C7,$8C,$2F,$82,$1F
	.byte $49,$49,$9C,$00,$00,$00,$78,$9B,$04,$00,$C0,$80,$A4,$80,$E8,$04


//;
S_9880: jmp L_98BA
//;
S_9883: jmp L_9B8B
//;
//$9886  --------
	.byte $4C,$C2,$9B
//;
L_9889: jmp L_9B9B
//;
S_988C: jmp L_9934
//;
SUB_WRITE_BROTHERS_NAME:
	jmp L_99AA
//;
S_9892: jmp L_9C25
//;
//$9895  --------
	.byte $41,$42,$43,$44,$3F

V_989A: .byte $00
V_989B: .byte $00,$00,$00,$00,$28,$B0,$12,$30,$AD,$05,$20,$AD,$1F,$3E,$A8,$00
	.byte $39,$A8,$24
V_98AE: .byte $14,$0F,$AA,$BE,$04,$14,$0A,$AA,$E1,$04
V_98B8: .byte $00
V_98B9: .byte $00
//;
L_98BA: ldy #$00
L_98BC: lda (zp02),y
	cmp #$3F  // look for end marker ("?" character)
	beq B_98D9
//;
	tya
	pha
	lda zp02
	pha
	lda zp02+1
	pha
//;
	jsr S_98DA  // print one character
//;
	pla
	sta zp02+1
	pla
	sta zp02
	pla
	tay
	iny
	jmp L_98BC
//;
B_98D9: rts
//$98DA  --------
S_98DA: lda (zp02),y
	cmp #$27
	bne B_98E4
	lda #$11
	bne B_98F5
B_98E4: cmp #$29
	bne B_98EC
	lda #$0F
	bne B_98F5
B_98EC: sec
	sbc #$20
	cmp #$21
	bcc B_98F5
	sbc #$1A
B_98F5: asl  // mul * 8
	asl
	asl
	tax
	lda #$00
	sta zp02+1
	lda zp04
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	asl
	rol zp02+1
	sta zp02
//;
	lda zp02+1
	adc #temp_gfx >> 8
	sta zp02+1
//;
	lda zp02
	adc zp04+1
	sta zp02
	bcc B_9920
	inc zp02+1
B_9920: inc zp04+1
	ldy #$00
B_9924: lda font,x
	inx
	eor (zp02),y
	sta (zp02),y
	tya
	clc
	adc #$20
	tay
	bne B_9924
	rts
//$9934  --------
L_9934: ldy colmap+$400+$322  // check color - take the value from the color map instead of LUM map
//;
	lda #$07  // 7 = yellow
	ldx #$07  // 7 = yellow
//;
//; dlums	db $00,$70,$40,$60, $40,$50,$30,$70, $40,$30,$50,$40, $50,$70,$50,$60
//; dcols	db $00,$01,$02,$03, $04,$05,$06,$07, $08,$09,$02,$01, $01,$05,$06,$01
//;
	cpy #$01
	beq B_9953
	cpy #$07
	beq B_9953
	cpy #$27
	beq B_9953
	cpy #$02
	beq B_9953
	cpy #$10
	beq B_9953
//;
	lda #$10  // #$63		; 6/3 = cyan on light blue, $10 is the index in our own lookup table
	ldx #$04  // 4 = purple
//;
B_9953: ldy #$03

//B_9955	
//;sta colmap+$322,y
	jsr set_322
//;

//;
//;dey
//;bpl B_9955
//;
	lda #$10
	jsr set_325
//;sta colmap+$325
//;
	jsr S_99B1
//;
	ldy #$09
	txa
	stx V_9B66
//;
	jsr set_35E
//;

//;
//B_9969	sta colmap+$35E,y		; border around brother's name
//	sta colmap+$3AE,y
//	dey
//	bpl B_9969
//;

//;
	lda #$FE  // $C2FE to $02 (16bit value)
	sta zp02
	lda #$C2
	sta zp02+1
//;
	jsr S_9A49
//;
	lda #$95  // $9895 to $98B8 (16bit value)
	sta V_98B8
	lda #$98
	sta V_98B9
	lda #$98
	sta V_9B11 + 1
	lda #$01
	sta V_9B16 + 1
	lda #$00
	sta V_9AFF + 1
	jsr S_9AAE
	lda #$A8
	sta V_9B11 + 1
	lda #$16
	sta V_9B16 + 1
//;
L_99AA: lda VAR_BROTHER_INDEX
	jmp S_99BC

	nop
//;
	nop
	nop
	nop

	nop
	nop
	nop
	nop
	nop
	nop

	nop
	nop
//;
//$99B1  --------
S_99B1: ldy #$06
//	lda #$01
B_99B5: lda #$70
	sta colmap+$387,y  // fixed inline
	lda #$01
	sta colmap+$400+$387,y
	dey
	bpl B_99B5
	rts
//$99BC  --------
S_99BC: lda #$05  // loop starts from 5, counts down
	sta zp07
//;
B_99C0: lda zp07  // X = zp07 * 3
	asl
	adc zp07
	tax
//;
	lda VAR_BROTHER_INDEX
	sta zp06
//;
	lda #$05
	sta V_989A
	sec
	sbc zp06
	cmp zp07
	bcs B_99DF
//;
	lda #$00
	sta V_989A
//;
	jmp L_99EB
//;
B_99DF: ldy zp07
	lda V_7D07
	cmp #$FF
	bne L_99EB
	sta V_989A
//;
L_99EB: ldy #$00
	lda #$05
	sec
	sbc zp07
	sta (zp0D),y
	inx
	lda V_989A
	cmp #$05
	beq B_9A0A
	cmp #$00
	bne B_9A05
	lda #$69
	jmp L_9A0D
//;
B_9A05: lda #$64
	jmp L_9A0D
//;
B_9A0A: lda V_989B,x
L_9A0D: iny
	sta (zp0D),y
	iny
	inx
	lda V_989B,x
	clc
V_9A16: adc #$00
	sta (zp0D),y
	inx
	iny
	lda V_989B,x
	clc
V_9A20: adc #$06
	sta (zp0D),y
	iny
	lda #$00
	sta (zp0D),y
	iny
	tya
	clc
	adc zp0D
	sta zp0D
	bcc B_9A34
	inc zp0D+1
B_9A34: inc V_6500
//;
	dec zp07
	bne B_99C0  // end of loop
//;
	jmp L_9A3E  // useless jump
//;
L_9A3E: jsr S_99B1
//;
	lda #(temp_gfx + $1516) & 255  // $C517 to $02 (16bit value)
	sta zp02
	lda #(temp_gfx + $1516) >> 8
	sta zp02+1
//;
S_9A49: lda #$18
	sta zp07
//;
B_9A4D: ldy #$08
	lda #$FF
B_9A51: sta (zp02),y
	dey
	bpl B_9A51
	lda zp02
	clc
	adc #$20
	sta zp02
	bcc B_9A61
	inc zp02+1
B_9A61: dec zp07
	bne B_9A4D
//;
	lda VAR_BROTHER_INDEX
	beq B_9AAD
//;
	sta V_9AFF + 1
	sec
	sbc #$01
	asl  // mul * 8
	asl
	asl
	clc
	adc #NAMES & 255  // $7980
	sta zp02
	sta V_98B8
	lda #$00
	adc #NAMES >> 8
	sta zp02+1
	sta V_98B9
//;
	lda #$B0  // $17B0 to $04 (16bit value)
	sta zp04
	lda #$17
	sta zp04+1
//;
	jsr L_98BA
//;
	ldy #$09
B_9A91: lda V_98AE,y
	sta (zp0D),y
	dey
	bpl B_9A91
	lda zp0D
	clc
	adc #$0A
	sta zp0D
	bcc B_9AA4
	inc zp0D+1
B_9AA4: inc V_6500
	inc V_6500
	jmp S_9AAE
//;
B_9AAD: rts
//$9AAE  --------
S_9AAE: lda #$3F
	ldy #$09
B_9AB2: sta V_7A80,y
	dey
	bpl B_9AB2
	lda V_98B8
	sta zp02
	lda V_98B9
	sta zp02+1
	ldy #$00
	ldx #$00
L_9AC6: lda (zp02),y
	cmp #$20
	bne B_9AD4
	sta V_7A80,y
	iny
	inx
	jmp L_9AC6
//;
B_9AD4: lda #$21
	sta V_7A80,y
//;
	lda V_9B66
//;sta colmap+$386,x
	jsr set_386
//;
	inx
L_9AE0: iny
	lda #$22
	sta V_7A80,y
	lda (zp02),y
	cmp #$3F
	php
	lda #$22
	plp
	beq B_9AF4
	inx
	jmp L_9AE0
//;
B_9AF4: sta V_7A80,y
	inx
	iny
	clc
	adc #$01
	sta V_7A80,y
V_9AFF: lda #$00
	beq B_9B09
//;
	lda V_9B66
//;sta colmap+$386,x
	jsr set_386
//;
B_9B09: lda #$80  // $7A80 to $02 (16bit value)
	sta zp02
	lda #$7A  // $A87A to $03 (16bit value)
	sta zp02+1
//;
V_9B11: lda #$A8
	sta zp04
	pha
V_9B16: lda #$16
	sta zp04+1
	pha
	jsr L_98BA
	ldy #$00
	jsr S_9B44
	pla
	sta zp04+1
	pla
	clc
	adc #$10
	sta zp04
	pha
	lda zp04+1
	pha
	jsr L_98BA
	ldy #$00
	jsr S_9B44
	pla
	sta zp04+1
	pla
	sec
	sbc #$08
	sta zp04
	jmp L_98BA
//;
S_9B44: lda V_7A80,y
	cmp #$3F
	beq B_9B65
	cmp #$20
	beq B_9B5C
	cmp #$25
	beq B_9B60
	lda #$03
	clc
	adc V_7A80,y
L_9B59: sta V_7A80,y
B_9B5C: iny
	jmp S_9B44
//;
B_9B60: lda #$20
	jmp L_9B59
//;
B_9B65: rts
//$9B66  --------
V_9B66: .byte $00
//;
B_9B67: lda #$71  // Color: White luminance 7
	sta $FF19  // Background color
B_9B6C: lda #$00
	jsr S_33D0
	lda $FF08  // Keyboard Latch
	cmp #$FF
	bne B_9B6C
//;
B_9B78: lda #$FD
	jsr S_33D0
	lda $FF08  // Keyboard Latch
	rol
	bcs B_9B78
//;
	lda #$00  // Color: Black
	sta $FF19  // Background color
//;
	jmp L_9B9B
//;
L_9B8B: lda V_7E17
	bne B_9C0B
//;
	lda #$7F
	jsr S_33D0
	lda $FF08  // Keyboard Latch
	rol
	bcc B_9B67
//;
L_9B9B: ldx #$02
	lda V_7E17
	bne B_9BD3
B_9BA2: dec V_7C7F,x
	lda V_7C7F,x
	cmp #$49  // "I"
	bcs B_9BB5
	cmp #$00
	bne B_9BC2
	lda #$50  // "P"
	sta V_7C7F,x
B_9BB5: dex
	bpl B_9BA2
	dec V_7C7E
	bne B_9BC2
//;
	lda #$01
	sta V_7E17
//;
B_9BC2: ldx #$05
B_9BC4: lda V_7C7C,x
	stx zp0A
	jsr S_9BD4
	ldx zp0A
	dex
	cpx #$01
	bne B_9BC4
B_9BD3: rts
//$9BD4  --------
S_9BD4: sta zp06
	txa
	asl  // mul * 8
	asl
	asl
	clc
	adc #$00
	sta zp02
	lda #(bitmap + $1900) >> 8
	adc #$00
	sta zp02+1
	lda zp06
	ldy #$00
	tax
	lda #$08
	sta zp07
B_9BEE: lda numbers,x
	eor #$FF
	sta (zp02),y
	inx
	iny
	inc zp06
	lda zp06
	cmp #$51  // "Q"
	bcs B_9C04
B_9BFF: dec zp07
	bne B_9BEE
	rts
//$9C04  --------
B_9C04: lda #$01
	tax
	sta zp06
	bne B_9BFF
B_9C0B: pla
	pla
	lda #$1A  // $9C1A to $02 (16bit value)
	sta zp02
	lda #$9C
	sta zp02+1
	lda #$70
	jmp L_0824  // screen colour mem
//;
V_9C1A: .byte $20,$47,$41,$4D,$45,$20,$4F,$56,$45,$52,$3F
//;
L_9C25: lda #$E2
	sta V_9A16 + 1
	lda #$71
	sta V_9A20 + 1
//;
	jsr L_99AA
//;
	lda #$00
	sta V_9A16 + 1
	lda #$06
	sta V_9A20 + 1
	rts
//$9C3D  --------
//$9C3D  --------
	.byte $80,$84,$24

V_9C40: .byte $00,$00,$00,$00,$00,$00,$00,$FF,$00,$03,$00,$C0,$04,$00,$20,$09
	.byte $00,$90,$0B,$00,$D0,$17,$81,$E8,$12,$00,$48,$10,$00,$08,$10,$00
.byte $18,$0C,$00,$30,$0A,$FC,$F0,$07,$87,$E0,$03,$FF,$C0,$00,$FF,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$FF,$00,$03,$FF,$C0,$07,$FF,$E0,$0F
V_9C80: .byte $FF
V_9C81: .byte $F0,$0F,$FF,$F0,$1F,$FF,$F8,$1F,$FF,$F8,$1F,$FF,$F8,$1F,$FF,$F8
	.byte $0F,$FF,$F0,$0F,$FF,$F0,$07,$FF,$E0,$03,$FF,$C0,$00,$FF,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$3E,$00,$01,$C1,$80,$06,$00
	.byte $60,$09,$00,$90,$17,$00,$E8,$23,$81,$C4,$22,$00,$44,$20,$00,$0C
.byte $18,$00,$18,$16,$F0,$38,$0D,$8D,$F0,$03,$FF,$C0,$00,$FF,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$3E,$00,$01,$FF,$80,$07,$FF
	.byte $E0,$0F,$FF,$F0,$1F,$FF,$F8,$3F,$FF,$FC,$3F,$FF,$FC,$3F,$FF,$FC
	.byte $1F,$FF,$F8,$1F,$FF,$F8,$0F,$FF,$C0,$00,$FF,$00,$00,$00,$00
V_9D00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$07
	.byte $00,$C0,$18,$00,$30,$2B,$01,$A8,$46,$00,$E4,$45,$01,$2C,$40,$00
	.byte $0C,$2E,$00,$3C,$19,$FC,$F8,$07,$7F,$F0,$00,$FF,$80,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$07
V_9D40: .byte $FF,$C0,$1F,$FF,$F0,$3F,$FF,$F8,$7F,$FF,$FC,$7F,$FF,$FC,$7F,$FF
	.byte $FC,$3F,$FF,$FC,$1F,$FF,$F8,$07,$FF,$F0,$01,$FF,$80,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$03,$FF,$81,$1C,$80,$B8,$23,$C3,$EC,$46,$00,$36,$78,$00
	.byte $0E,$4B,$9C,$1E,$36,$F6,$FC,$0E,$07,$F0,$01,$FF,$80,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$03,$FF,$C0,$0F,$FF,$F0,$3F,$FF,$FC,$7F,$FF,$FE,$7F,$FF
	.byte $FE,$7F,$FF,$FE,$3F,$FF,$FC,$0F,$FF,$F0,$01,$FF,$C0,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$FF,$80,$0E
	.byte $00,$70,$30,$C6,$0C,$47,$E7,$E2,$83,$01,$81,$B8,$70,$01,$AD,$DE
	.byte $FB,$63,$03,$8E,$3C,$00,$FC,$07,$FF,$E0,$00,$FF,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$7F,$00,$07
V_9E00: .byte $FF,$F0,$3F,$FF,$FC,$7F,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF,$FF,$FF
	.byte $FF,$FF,$FF,$FF,$FF,$7F,$FF,$FE,$3F,$FF,$FC,$0F,$FF,$F0,$00,$FF
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_9F00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A000: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A100: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A200: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A300: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A400: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A500: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A600: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A700: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A800: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_A87A: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00
V_A900: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AA00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AB00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AC00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AD00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AE00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_AF00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B000: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B100: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B200: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B300: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B400: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B500: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B600: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B700: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B800: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_B900: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BA00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BB00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BC00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BD00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BE00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
V_BF00: .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$C0,$C0,$C0,$F0,$70,$7C,$DF,$0D,$0D,$0D,$0D,$0D,$4D,$0D,$FD
	.byte $89,$89,$8D,$8D,$89,$89,$89,$89,$70,$70,$50,$70,$70,$70,$70,$7F
	.byte $00,$00,$00,$00,$00,$00,$00,$A0,$0A,$0F,$0A,$0F,$0A,$0A,$0A,$0A
	.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$8A,$AA
	.byte $5D,$51,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$D5,$55,$55,$55
	.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$D5,$55,$57,$55
	.byte $57,$5D,$57,$5F,$5F,$FF,$7F,$FF,$77,$7F,$FF,$FF,$FF,$FF,$FF,$FF
	.byte $5B,$56,$55,$55,$55,$44,$10,$40,$FF,$FF,$BF,$4F,$5B,$00,$00,$00
	.byte $FF,$FF,$FF,$FF,$FF,$8F,$0F,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FC,$00
	.byte $F7,$BF,$FF,$FF,$FD,$D1,$00,$00,$FD,$F5,$D5,$55,$D5,$11,$05,$00
	.byte $55,$FD,$FF,$FF,$FF,$FF,$FF,$FF,$55,$55,$DD,$D9,$F7,$FD,$FF,$FD
	.byte $FD,$4F,$59,$56,$55,$55,$55,$F5,$55,$55,$D5,$F7,$9D,$6F,$44,$75
//;

lums: .byte $50,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$50,$60,$70,$70
cols: .byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$02,$04,$05,$03,$07,$01

L_12E9: lda (zp02),y
//;
S_12EB:
	lsr
	lsr
	lsr
	tay
	lda cols,y
	tax
	lda lums,y

//	ldy #$03		; 3 = $63 cyan
//	cmp #$68
//	beq cyan

//	;beq B_130B
//	;ldy #$01		; 1 = $71 white
//	cmp #$78
//	;beq B_130B

//	;ldy #$04		; 4 = $44 purple
//	cmp #$58	; "X"
//	;beq B_130B
//	;ldy #$07		; 7 = $77 yellow
//	cmp #$70
//	;beq B_130B
//	;ldy #$02		; 2 = $42 red
//	cmp #$50	; "P"
//	;beq B_130B
//	;ldy #$05		; 5 = $55 green
//	;
//cyan	lda #$06
//	ldx #$30
//	;bne
//;
clset: ldy #$1F
cl1: sta colmap + $000,y
	sta colmap + $028,y
	sta colmap + $050,y
	sta colmap + $078,y
	sta colmap + $0A0,y
	sta colmap + $0C8,y
	sta colmap + $0F0,y
	sta colmap + $118,y
	sta colmap + $140,y
	sta colmap + $168,y
	sta colmap + $190,y
	sta colmap + $1B8,y
	sta colmap + $1E0,y
	sta colmap + $208,y
	sta colmap + $230,y
	sta colmap + $258,y
	sta colmap + $280,y
	sta colmap + $2A8,y
	sta colmap + $2D0,y
	sta colmap + $2F8,y
	sta colmap + $320,y
	sta colmap + $348,y
	sta colmap + $370,y
	sta colmap + $398,y
	dey
	bpl cl1
//;
	txa
	ldy #$1F
cl2: sta colmap + $400,y
	sta colmap + $428,y
	sta colmap + $450,y
	sta colmap + $478,y
	sta colmap + $4A0,y
	sta colmap + $4C8,y
	sta colmap + $4F0,y
	sta colmap + $518,y
	sta colmap + $540,y
	sta colmap + $568,y
	sta colmap + $590,y
	sta colmap + $5B8,y
	sta colmap + $5E0,y
	sta colmap + $608,y
	sta colmap + $630,y
	sta colmap + $658,y
	sta colmap + $680,y
	sta colmap + $6A8,y
	sta colmap + $6D0,y
	sta colmap + $6F8,y
	sta colmap + $720,y
	sta colmap + $748,y
	sta colmap + $770,y
	sta colmap + $798,y
	dey
	bpl cl2
//;
	rts

//;
//; note: $07 means background is $7 (yellow), ink is $0 (black)
//;
dlums: .byte $00,$70,$40,$60,$40,$50,$30,$70,$40,$30,$50,$40,$50,$70,$50,$60,$63
dcols: .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$02,$01,$01,$05,$06,$01,$63

set_35D:
	lda #$70  // fixed value
	sta colmap+$35D
	sta colmap+$385
	sta colmap+$3AD
	lda #$07
	sta colmap+$400+$35D
	sta colmap+$400+$385
	sta colmap+$400+$3AD
	rts

set_321:
	tax
	lda dlums,x
	sta colmap+$321
	sta colmap+$326
	lda dcols,x
	sta colmap+$400+$321
	sta colmap+$400+$326
	txa
	rts

set_322:
	stx xsave1+1
	tax
s2: lda dlums,x
	sta colmap+$322,y
	lda dcols,x
	sta colmap+$400+$322,y
	dey
	bpl s2
xsave1: ldx #$00
	rts

set_325:
	lda #$07  // white on black (inverted)
	sta colmap+$325
	lda #$10
	sta colmap+$400+$325
	rts

set_35E:
	tax
s1: lda dlums,x
	sta colmap+$35E,y  // border around brother's name
	sta colmap+$3AE,y
	lda dcols,x
	sta colmap+$400+$35E,y
	sta colmap+$400+$3AE,y
	dey
	bpl s1
	rts

set_386:
	sty ysave1+1
	tay
	lda dlums,y
	sta colmap+$386,x
	lda dcols,y
	sta colmap+$400+$386,x
ysave1: ldy #$00
	rts

set_02:
	sty ysave2+1
	sta asave2+1
	tay
	lda dlums,y
	ldy ysave2+1
	sta (zp02),y
//;
	lda zp02+1
	ora #$04
	sta zp02+1
//;
	ldy asave2+1
	lda dcols,y
	ldy ysave2+1
	sta (zp02),y
//;
	lda zp02+1
	and #$FB
	sta zp02+1
//;
asave2: lda #$00
ysave2: ldy #$00
	rts

set_04:
	sty ysave3+1
	sta asave3+1
	tay
	lda dlums,y
	ldy ysave3+1
	sta (zp04),y
//;
	lda zp04+1
	ora #$04
	sta zp04+1
//;
	ldy asave3+1
	lda dcols,y
	ldy ysave3+1
	sta (zp04),y
//;
	lda zp04+1
	and #$FB
	sta zp04+1
//;
asave3: lda #$00
ysave3: ldy #$00
	rts

disp_bro_name_fix:
	ldx #$27
	lda #$FF
cl3:
	sta temp_gfx + $1517,x
	sta temp_gfx + $153F,x
	sta temp_gfx + $1567,x
	sta temp_gfx + $158F,x
	sta temp_gfx + $15B7,x
	sta temp_gfx + $15DF,x
	sta temp_gfx + $1607,x
	sta temp_gfx + $162F,x
	sta temp_gfx + $1657,x
	sta temp_gfx + $167F,x
	sta temp_gfx + $16A7,x
	sta temp_gfx + $16CF,x
	sta temp_gfx + $16F7,x
	sta temp_gfx + $171F,x
	dex
	bpl cl3
	jmp SUB_WRITE_BROTHERS_NAME

//;
//; ---
//; 7f 7f bf 1f
//; to a59c
//; from e493
//; from 5143


	.if (* < $C2A3) { .fill $C2A3-*, $FF }
	* = $c2a3

zx_spawn_pos:  // zx spectrum spawn positions plus q key dont kill brothers

	.byte $10,$10,$28,$51,$40,$40,$11,$96,$30,$60,$11,$50
	.byte $40,$40,$39,$71,$30,$60,$11,$07,$a9,$08,$85,$2c
	.byte $4c,$d8,$1a,$c9,$02,$d0,$12,$ad,$7a,$7c,$8d,$6e
	.byte $7c,$ad,$7b,$7c,$8d,$6f,$7c,$ad,$7c,$7c,$8d,$71,$7c,$60

// 872 - 20 mozognak a blokkok, 2c allnak a blokkok

billnyom:

//	lda #$ef	; set latch fe
//	sta $fd30
//	sta $ff08


	lda $ff08
	rts

	and #$10  // f1 pressed
	bne nemnem
	sta $ff3f
	lda $c300
	cmp #$10
	beq kikapcs
	cmp #$20
	beq bekapcs
        jmp nemnem

kikapcs: lda #$4a
 	sta $ff19
	lda #$2c
	sta $0872
	jmp nemnem

bekapcs: lda #$00
 	sta $ff19
	lda #$20
	sta $0872
	lda #$00
	sta $c300
	jmp nemnem

nemnem:

//	lda $c400
//	sta $fd30
//	lda $c401
//	sta $ff0
	inc $c300
	lda $ff08
	rts



// EOF
