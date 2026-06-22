; func_ov002_021bab38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b229c
        .extern func_ov002_021b27a4
        .extern func_ov002_021b9254
        .extern func_ov002_021b9368
        .extern func_ov002_021ba11c
        .extern func_ov002_021ba1a0
        .extern func_ov002_021ba1e8
        .extern func_ov002_021c2a40
        .extern func_ov002_021c2abc
        .extern func_ov002_021c3754
        .global func_ov002_021bab38
        .arm
func_ov002_021bab38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    sub r1, r5, #0xb
    mov ip, r2
    mov r4, r3
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_1bc
    b .L_1b0
    b .L_16c
    b .L_178
    b .L_194
    b .L_1a0
    b .L_1fc
.L_16c:
    mov r1, r4
    bl func_ov002_021ba1e8
    b .L_1fc
.L_178:
    cmp ip, #0x0
    mov r1, r4
    beq .L_18c
    bl func_ov002_021ba1a0
    b .L_1fc
.L_18c:
    bl func_ov002_021ba11c
    b .L_1fc
.L_194:
    mov r0, r4
    bl func_ov002_021c2a40
    b .L_1fc
.L_1a0:
    mov r0, r4
    mov r1, ip
    bl func_ov002_021c2abc
    b .L_1fc
.L_1b0:
    mov r1, r4
    bl func_ov002_021c3754
    b .L_1fc
.L_1bc:
    cmp r5, #0x5
    bge .L_1ec
    mov r1, ip, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and ip, ip, #0xff
    mov r1, r5
    mov r2, r4
    and r3, r3, #0xff
    str ip, [sp]
    bl func_ov002_021b9254
    b .L_1fc
.L_1ec:
    mov r1, r5
    mov r2, r4
    and r3, ip, #0xff
    bl func_ov002_021b9368
.L_1fc:
    cmp r5, #0xb
    cmpne r5, #0xc
    cmpne r5, #0xd
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b229c
    ldr r1, [r4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021b27a4
    ldmia sp!, {r3, r4, r5, pc}
