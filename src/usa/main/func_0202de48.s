; func_0202de48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b884
        .global func_0202de48
        .arm
func_0202de48:
    stmdb sp!, {r3, lr}
    bl func_0202b884
    cmp r0, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_578
    b .L_4f8
    b .L_500
    b .L_508
    b .L_510
    b .L_518
    b .L_520
    b .L_528
    b .L_530
    b .L_538
    b .L_540
    b .L_548
    b .L_550
    b .L_558
    b .L_560
    b .L_568
    b .L_570
.L_4f8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_500:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_508:
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_510:
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_518:
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_520:
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_528:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_530:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_538:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_540:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_548:
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_550:
    mov r0, #0x5
    ldmia sp!, {r3, pc}
.L_558:
    mov r0, #0x6
    ldmia sp!, {r3, pc}
.L_560:
    mov r0, #0x7
    ldmia sp!, {r3, pc}
.L_568:
    mov r0, #0x8
    ldmia sp!, {r3, pc}
.L_570:
    mov r0, #0x9
    ldmia sp!, {r3, pc}
.L_578:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
