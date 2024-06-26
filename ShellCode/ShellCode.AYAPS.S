.include "DummyHead.S"

/* Shell Code for Ayaneo Pocket S */
_ShellCodeStart:
    movz    x4, #0xd000
    movk    x4, #0x0f16, lsl #16    // Store 0xf16d000 to x4, which is io control of gpio109 on sm8550.
    str     wzr, [x4], #4           // Set 0 in control reg, then x4 add 4
    ldr     w5, [x4]                // Get status value from address stored in x4 and store it to w5.
    and     w5, w5, #1              // w5 & 1 and save value in w5.
    cbz     w5, _UEFI               // Compare w5 with 0, if w5 == 0 goto _UEFI, else execute next instruction(jmp Linux).

.include "CommonTail.S"
/* Do not remove the last line  */
