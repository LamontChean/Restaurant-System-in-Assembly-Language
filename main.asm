TITLE APLUS NASI LEMAK ORDERING SYSTEM	
.MODEL SMALL
.STACK 
.DATA
	newLine 	DW 0d0aH, "$"
	divisor 	DB 10
	quotient 	DB 0
	remainder 	DB 0

;--- data for logo
	logo		DB "                     ___", 0dH, 0aH
			DB "                    /   |      _", 0dH, 0aH
			DB "                   / /| |   __| |__", 0dH, 0aH
			DB "                  / /_| |  |__   __|", 0dH, 0aH
			DB "          ~ ~ ~  /  __  |     |_|    ~ ~ ~", 0dH, 0aH
			DB "    ____/. ` .  /_/   |_|         ; ` . ` . `.\____", 0dH, 0aH
			DB "   /   ( `.`;`.`,.NASI LEMAK HOUSE ; `.`;`.`;  )   \", 0dH, 0aH
			DB "  /       =      `.`;`.``.`;`.``.`;`.`=  /     /    \", 0dH, 0aH
			DB " /     /    /    /    /     /     /     /     /      \", 0dH, 0aH
			DB "/_____/____/____/____/_____/_____/_____/_____/____/___\", 0dH, 0aH,"$"
;--- Modules menu
	StaffMenu	DB 13, 10, "  ==================================================== ", 13, 10
			DB " [_________________Staff Administration_______________]", 13, 10
			DB " [                                                    ]", 13, 10
			DB " [  1.Daily Summary Report                            ]", 13, 10
			DB " [  2.Restocking                                      ]", 13, 10
			DB " [  3.Price Adjustment                                ]", 13, 10
			DB " [  4.Log Out                                         ]", 13, 10
			DB "  ==================================================== ", 13, 10, "$"

	CustomerMenu	DB 13, 10, "  ==================================================== ", 13, 10
			DB " [______A PLUS NASI LEMAK HOUSE ORDERING SYSTEM_______]", 13, 10
			DB " [                                                    ]", 13, 10
			DB " [  1.Order Food & Beverages                          ]", 13, 10
			DB " [  2.Membership Information                          ]", 13, 10
			DB " [  3.Log Out                                         ]", 13, 10
			DB "  ==================================================== ", 13, 10, "$"
	staffPrompt	DB 13, 10, "Enter Your Option(1-4) > $"
	customerPrompt	DB 13, 10, "Enter Your Option(1-3) > $"
;------ Jun
         failmsg            DB  0dh, 0ah, "Please enter [1-4]! Press any to continue$"
         nextline            DB  0dh, 0ah, "$"
         ;---main page
         firstPage          DB  0dh, 0ah,"Welcome to APLUS Nasi Lemak House!"
                            DB  0dh, 0ah, "+-----------------+"
                            DB  0dh, 0ah, "| 1. LOG IN       |"
                            DB  0dh, 0ah, "| 2. REGISTER     |"
                            DB  0dh, 0ah, "| 3. Guest        |"
                            DB  0dh, 0ah, "| 4. Exit         |"
                            DB  0dh, 0ah, "+-----------------+"
                            DB  0dh, 0ah, "Enter Your Option(1-4) > $"
         choosen            DB  ?

         ;---register page
         secondPage         DB  0dh, 0ah, "Welcome to Register Page!"
                            DB  0dh, 0ah, "Please Fill in all the details to register.$"
         rgt1               DB  0dh, 0ah, "Please enter your name :$"
         rgt2               DB  0dh, 0ah, "Please enter your IC number not including(-) :$"
         rgt3               DB  0dh, 0ah, "Please enter your Phone Number not including(-) :$"
         rgt4               DB  0dh, 0ah, "Please enter your Password in any 8 or above Alphanumeric symbols :$"
         rgt5               DB  0dh, 0ah, "Your Name is $"
         rgt6               DB  0dh, 0ah, "Your ic number is $"
         rgt7               DB  0dh, 0ah, "Your Phone Number is $"
         rgt8               DB  0dh, 0ah, "Your Password is $"
         rgt9               DB  0dh, 0ah, "Register Successful! Press any back to home Page. $"
         rgt10              DB  0dh, 0ah, "Fail to register.Press any back to home Page. $"
         confirmrgt         DB  0dh, 0ah, "Please comfirm Your details. "
                            DB  0dh, 0ah, "Confirm to register [Y=yes, N=no] :$. "
         rgtconf1           DB  0dh, 0ah, "Confirm your Name ? [Y=yes, N=no] :$. "
         rgtconf2           DB  0dh, 0ah, "Confirm your Ic Number ? [Y=yes, N=no] :$. "
         rgtconf3           DB  0dh, 0ah, "Confirm your Phone Number ? [Y=yes, N=no] :$. "
         rgtconf4           DB  0dh, 0ah, "Confirm Your Password? [Y=yes, N=no] :$. "
         salahinsert        DB  0dh, 0ah, "Please key in just Y or N !!$. "
         salahname          DB  0dh, 0ah, "Please key in 3 word or above name!!$. "
         salahic            DB  0dh, 0ah, "Please key in just 12 numbers!!$. "
         salahphone         DB  0dh, 0ah, "Please key in just 10/11 numbers!!$. "
         salahpass          DB  0dh, 0ah, "Please key in 8 or above as password!!$. "
         choosergt          DB  ?

         namelist           label byte
         maxname            DB  20
         actname            DB  ?
         nameinput          DB  20 DUP("$")

         iclist             label byte
         maxic              DB  20
         actic              DB  ?
         icinput            DB  20 DUP("$")

         phonelist          label byte
         maxphone           DB  20
         actphone           DB  ?
         phoneinput         DB  20 DUP("$")

         cipherlist         label byte
         maxcipher          DB  20
         actcipher          DB  ?
         cipherinput        DB  20 DUP("$")

         ;---login page
         thirdPage          DB  0dh, 0ah, "Welcome to Login Page!"
                            DB  0dh, 0ah, "Please Fill in the IC number and Password to Login.$"
         lgn1               DB  0dh, 0ah, "Please enter your IC number(without [-])  :$"
         lgn2               DB  0dh, 0ah, "Please enter your Password  :$"
         lgn3               DB  0dh, 0ah, "Wrong IC Number! Please press any to login again!$"
         lgn4               DB  0dh, 0ah, "Wrong Password! Please press any to login agin!$"
         validate           DB  0dh, 0ah, "Login Successul!$"
         validatestaff      DB  0dh, 0ah, "Login Successul! You are in Staff mode. $"
         lgnnum             DB  ?

         UserN    label byte
         maxN     DB 20
         actN     DB ?
         inputN   DB 20 DUP("$")

         UserX    label byte
         maxX     DB 20
         actX     DB ?
         inputX   DB 20 DUP("$")

         ;--- staff
         staffID            DB  "admin"


         ;---guest
         gut                DB  0dh, 0ah, "Your are in Guest Mode$"

         ;---logout
         lgout              DB  0dh, 0ah, "Are you sure want to log out?"
                            DB  0dh, 0ah, "+-----------------------+"
                            DB  0dh, 0ah, "| 1.Back To Menu        |"
                            DB  0dh, 0ah, "| 2.Log Out             |"
                            DB  0dh, 0ah, "+-----------------------+$"
         logoutNum          DB  ?
;------ Jess
;--- data for order menu
	order		DB " .__________________.", 0dH, 0aH
			DB " |___ORDER OPTION___|", 0dH, 0aH
			DB " |  1. Dine In      |", 0dH, 0aH
			DB " |  2. Delivery     |", 0dH, 0aH
			DB " |  3. Take Away    |", 0dH, 0aH
			DB " |  4. Back to Menu |", 0dH, 0aH
			DB " '------------------'", "$"
	ostate		DB "Enter order option : $"
	onum		DB ?
	eromsgo		DB "Please enter input from 1 to 3 only!! $"
	conf		DB "Do you want to confirm(Y=yes|N=no)? ", "$"
	eromsgconf	DB "Please enter Y or N only!!$"
;--- data for food menu
	menuH		DB " ._____________________________________________________.", 0dH, 0aH, "$"
	food		DB " |______________________FOOD MENU______________________|", 0dH, 0aH
			DB " |---------------MAIN DISH---------------|--Price(RM)--|", 0dH, 0aH, "$"
	food1		DB " | NL1 Nasi Lemak with Fried Chicken     |    ", "$"
	food2		DB " | NL2 Nasi Lemak with Rendang Chicken   |    ", "$"
	food3		DB " | NL3 Nasi Lemak with Curry Chicken     |    ", "$"
	menuL		DB " '-----------------------------------------------------'", 0dH, 0aH,"$"
	menuE		DB "    |", 0dH, 0aH, "$"
	fprice		DB 9, 10, 11
	fpriceD		DB 50, 80, 20
	fstate		DB "Enter food choice and amount (max amount is 9, 0 to skip): $"
	fnum		DB 1, 2, 3
	fqty		DB 3 DUP (0)
	addOn		DB "Do you want to add on(Y=yes|N=no)? $"
	eromsgf		DB "Please enter input from 1 to 3 only!! $"
	input1		DB 1
	nomorefood	DB "Sorry, it is out of stock. $"
	nomorefood1	DB "Insufficient stock left. Item left is $"
;--- data for beverage menu
	beverage	DB " |____________________BEVERAGE MENU____________________|", 0dH, 0aH
			DB " |---------------BEVERAGES---------------|--Price(RM)--|", 0dH, 0aH, "$"
	beverage1	DB " | D1 Coffee                             |    ", "$"
	beverage2	DB " | D2 Orange Juice                       |    ", "$"
	beverage3	DB " | D3 Apple Juice                        |    ", "$"
	beverage4	DB " | D4 Sky Juice                          |    ", "$"
	bprice		DB 2, 5, 5, 1
	bpriceD		DB 50, 30, 30, 00
	bstate		DB "Enter beverage choice and amount (max amount is 9, 0 to skip): $"
	bnum		DB 1, 2, 3, 4
	bqty		DB 4 DUP (0)
	eromsgb		DB "Please enter input from 1 to 4 only!! $"
;--- data for order module
	module		DB " .__________________.", 0dH, 0aH
			DB " |______MODULE______|", 0dH, 0aH
			DB " | 1. Make Payment  |", 0dH, 0aH
			DB " | 2. Cancel order  |", 0dH, 0aH
			DB " '------------------'", "$"
	mstate		DB "Enter module option : $"
	mnum		DB ?
	eromsgm		DB "Please enter input 1 or 2 only!! $"
;--- data for payment
	payment		DB " ._________________________________________________________________.", 0dH, 0aH
			DB " |_____________________________PAYMENT_____________________________|", 0dH, 0aH
			DB " |-----------------ITEMS-----------------|---Qty---|-Subtotal (RM)-|", 0dH, 0aH, "$"
	space1		DB "   |    $"
	subTf		DW 3 DUP (0)
	subTDf		Dw 3 DUP (0)
	subTb		DW 4 DUP (0)
	subTDb		Dw 4 DUP (0)
	space2		DB "     |$"
	paymentL	DB " '-----------------------------------------------------------------'", 0dH, 0aH, "$"
	delistate	DB "                                     Delivery Fee : RM   $"
	deliFee		DB 5
	packageTax	DB "                                    Packaging Tax : RM   $"
	packageFee	DB 5; 5%
	pack		DB 0
	packD		DB 0
	SSTstate	DB "                                          SST(5%) : RM   $"
	SSTTax		DB 5; 5%
	SST		DB 0
	SSTD		DB 0
	ifMem		DB 0	; get member 
	dctstate	DB "                                         Discount : RM   $"
	discount	DB 10; 10%
	disc		DB 0
	discD		DB 0
	roundstate	DB "                                     Rounding Adj : RM   $"
	round16		DB "-0.01", 0dH, 0aH, "$"
	round27		DB "-0.02", 0dH, 0aH, "$"
	round38		DB "+0.02", 0dH, 0aH, "$"
	round49		DB "+0.01", 0dH, 0aH, "$"
	round50		DB " 0.00", 0dH, 0aH, "$"
	totalstate	DB "                                            TOTAL : RM  $"
	total		DW 0
	totalD		DW 0
	cashstate	DB "Enter Cash amount : RM $"
	cashIN		DB 4 DUP ("$")
	cashIND		DB 2 DUP (0)
	cash		DW 0
	cashD		DB 0
	eromsgc		DB "Please enter in the format of RM xxx.xx !", 0dH, 0aH, "$"
	eromsgc1	DB "Insufficient amount of cash has been entered. Please enter again.", 0dH, 0aH, "$"
	errcount	DB 0
	chgstate	DB "Change : RM $"
	change		DW 0
	changeD		DB 0
	paymentE	DB "   \Thank you for coming/", 0dH, 0aH
			DB "\Please come again next time./", 0dH, 0aH, "$"
	btmenu		DB "Press any to proceed...... $"
;--- data for restock
	stock		DB 0dH, 0aH, ".___________________.", 0dH, 0aH
			DB "|_______STOCK_______|", 0dH, 0aH
			DB "|   1. Food         |", 0dH, 0aH
			DB "|   2. Beverage     |", 0dH, 0aH
			DB "|   3. Exit         |", 0dH, 0aH
			DB "'-------------------'", "$"
	sstate		DB "Enter the Category : $"
	snum		DB 0
	fstock		DB " |______________________FOOD MENU______________________|", 0dH, 0aH
			DB " |---------------MAIN DISH---------------|--Stock Qty--|", 0dH, 0aH, "$"
	bstock		DB " |____________________BEVERAGE MENU____________________|", 0dH, 0aH
			DB " |---------------BEVERAGES---------------|--Stock Qty--|", 0dH, 0aH, "$"
	fsqty		DW 3 DUP (100)
	bsqty		DW 4 DUP (100)
	eromsgs		DB "Please enter input from 1 to 3 only!! $"
	restock		DB ".___________________.", 0dH, 0aH
			DB "|______RESTOCK______|", 0dH, 0aH
			DB "|  1. All           |", 0dH, 0aH
			DB "|  2. Certain Item  |", 0dH, 0aH
			DB "|  3. Return        |", 0dH, 0aH
			DB "'-------------------'", "$"
	rstate		DB "Enter the Category to Restock : $"
	rnum		DB 0
	promptsq	DB "Enter the Restock quantity (Max Stock Qty = 999) : $"
	SqtyIN		DB 4 DUP ("$")
	sqty		DW 0
	promptsp	DB "Enter the price used to Restock(RM xxx.xx) : RM $"
	stockIN		DB 4 DUP ("$")
	stockIND	DB 2 DUP (0)
	sprice		DW 0
	spriceD		DB 0
	getfnum		DB "Enter the food : NL$"
	getbnum		DB "Enter the drink : D$"
	gnum		DB ?
	errmsgrange	DB "The total have exceeded 999! Please enter again! $"
	eromsgcs	DB "Please enter numerical number only! $"
;;------ CK
;--- data for price adjustment
	frameH		DB	" ._____________________________________.", 0dH, 0aH,"$"
	category	DB	" |______________F&B MENU_______________|", 0dH, 0aH
			DB 	" |--------------CATEGORY---------------|", 0dH, 0aH
			DB	" | 1.Food                              |", 0dH, 0aH
			DB	" | 2.Beverage                          |", 0dH, 0aH
			DB	" | 3.Exit                              |", 0dH, 0aH,"$"
	frameL		DB	" '-------------------------------------'", 0dH, 0aH,"$"
	prompt1		DB	"Enter the Category(1-3)   > $"
	prompt2		DB	"Enter the Adjustment(1-5) > $"
	prompt3		DB	"Enter the Value to Increase(00.00 to quit)   > $"
	prompt4		DB	"Enter the food  > NL$"
	prompt5		DB	"Enter the drink > D$"
	prompt6		DB	"Enter the Value to Decrease(00.00 to quit)   > $"
	prompt7		DB	"Confirm to Proceed(Y=yes|N=no)  > $"
	prompt8		DB	13, 10, "Enter the percentage to Increase", 13, 10, "(MAXIMUM 200% - including %)  > $"
	prompt9		DB	13, 10, "Enter the percentage to Decrease", 13, 10, "(Maximum 100% - including %)  > $"
	value		DB	4	DUP	(0)
	Percentage_list label byte
	maxP	DB	5
	actP	DB	?
	Percentage DB 4 DUP (0)
	accP		DW	0
	chkval		DB	"Invalid input, please try again!$"
	chk1n2		DB	"Invalid input, please try again(1-2)!$"
	chk1n5		DB	"Invalid input, please try again(1-5)!$"
	chk1n3		DB	"Invalid input, please try again(1-3)!$"
	chk1n4		DB	"Invalid input, please try again(1-4)!$"
	chkp		DB	"Invalid input, maximum is only 200%!$"
	error1		DB	"Input is greater than original price!$"
	input		DB	?
	ten		DB	10
	hundred		DB	100
	hundred2	DW	100
	tenThousand	DW	1000
	proceed		DB	?
	adjustment	DB	" |___________ADJUSTMENT MENU___________|", 0dH, 0aH
			DB 	" |---------------METHODS---------------|", 0dH, 0aH
			DB	" | 1.Increase All By Percentage        |", 0dH, 0aH
			DB	" | 2.Increase All Products By Value    |", 0dH, 0aH
			DB	" | 3.Decrease All By Percentage        |", 0dH, 0aH
			DB	" | 4.Decrease Value(Particular Product)|", 0dH, 0aH
			DB	" | 5.Return                            |", 0dH, 0aH,"$"
;--- data for reporting
	report		DB	" |_____________REPORT MENU_____________|", 0dH, 0aH
			DB 	" |----------------TYPES----------------|", 0dH, 0aH
			DB	" | 1.Earning Report                    |", 0dH, 0aH
			DB	" | 2.Expenses Report                   |", 0dH, 0aH
			DB	" | 3.Exit                              |", 0dH, 0aH,"$"
	prompt10	DB	13, 10, "Enter the Report Type(1-3)  > $"
	R1title		DB	13, 10, "                      Earning Report on $"
	R2title		DB	13, 10, "                      Expenses Report on $"
	fd1		DB	" | NL1 Nasi Lemak with Fried Chicken     |   ", "$"
	fd2		DB 	" | NL2 Nasi Lemak with Rendang Chicken   |   ", "$"
	fd3		DB 	" | NL3 Nasi Lemak with Sambal Petai      |   ", "$"
	bv1		DB 	" | D1 Coffee                             |   ", "$"
	bv2		DB 	" | D2 Orange Juice                       |   ", "$"
	bv3		DB 	" | D3 Apple Juice                        |   ", "$"
	bv4		DB 	" | D4 Sky Juice                          |   ", "$"
	thirdD		DB	0
	QTYNLH		DB	3 DUP (0)
	QTYNL		DB	3 DUP (0)
	SUBNL		DW	3 DUP (0)
	SUBDNL		DW	3 DUP (0)
	QTYDH		DB	4 DUP (0)
	QTYD		DB	4 DUP (0)
	SUBD		DW	4 DUP (0)
	SUBDD		DW	4 DUP (0)
	taxT		DW	0
	taxD		DW	0
	DisT		DW	0
	DisTD		DW	0
	extraT		DW	0
	extraTD		DW	0
	TTL		DW	0
	TTLD		DW	0
	year		DW	0
	month		DB	0
	day		DB	0
	earnH		DB 13, 10, " ._________________________________________________________________.", 0dH, 0aH
			DB " |_____________________________EARNING_____________________________|", 0dH, 0aH
			DB " |-----------------ITEMS-----------------|---Qty---|-Subtotal (RM)-|", 0dH, 0aH, "$"
	flabel		DB " |-FOOD----------------------------------|---------|---------------|", 0dH, 0aH, "$"
	dlabel		DB " |-Beverages-----------------------------|---------|---------------|", 0dH, 0aH, "$"
	expH		DB 13, 10, "     ._________________________________________________.", 0dH, 0aH
			DB "     |____________________EXPENSES_____________________|", 0dH, 0aH
			DB "     |-----------------ITEMS-----------------|---Qty---|", 0dH, 0aH, "$"
	expL		DB "     '-------------------------------------------------'", 13, 10, "$"
	Rmsg1		DB 13, 10, "                                 Total SST Collection :   RM $"
	Rmsg2		DB 13, 10, "                                       Total Discount : - RM $"
	Rmsg3		DB 13, 10, "                                        Total Earning :   RM $"
	Rmsg6		DB 13, 10, "                                        Extra Charges :   RM $"
	Rmsg7		DB 13, 10, "                         Cash Out Amount :   RM $"
	Rmsg4		DB 13, 10, "                                         Rounding Adj : - RM 00.0$"
	Rmsg5		DB 13, 10, "                                         Rounding Adj : + RM 00.0$"
	roundingVal	DB 0
	sale		DB 13, 10, "              ! BEST-SELLING NASI LEMAK OF THE DAY NL$"
	Findex		DB 0
	compareval	DW 3 DUP (?)
	reFqty		DW 0, 0, 0
	reBqty		DW 0, 0, 0, 0
	bsmsg		DB "Press any key to return...$"
	
;------ Nic
;--- data for membership
	memStart	DB	"._____________________________________________________.", 0dH, 0aH
			DB	"|                  |  Membership  |                   |", 0dH, 0aH
			DB	"|                  '--------------'                   |", 0dH, 0aH, "$"
	memHeader	DB	" .___________________________________________________.", 0dH, 0aH
			DB	" |_____________________Membership____________________|", 0dH, 0aH, "$"
	memExp		DB	" |---------------------INFORMATION-------------------|", 0dH, 0aH, "$"
	memRenew	DB	" |-----------------------OPTION----------------------|", 0dH, 0aH
			DB	" |        1. 3 Months                RM 20.00        |", 0dH, 0aH
			DB      " |        2. 6 Months                RM 35.00        |", 0dH, 0aH
			DB	" |        3. 1 Year                  RM 45.00        |", 0dH, 0aH
			DB	" |        4. Return                                  |", 0dH, 0aH, "$"
	memCate		DB	" |----------------------CATEGORY---------------------|", 0dH, 0aH
			DB	" |            1. View Membership Duration            |", 0dH, 0aH
			DB      " |            2. Renew Membership                    |", 0dH, 0aH, "$"
	memDuraBefore	DB	" |----------------------DURATION---------------------|", 0dH, 0aH
			DB	" |                                                   |", 0dH, 0aH
			DB	" |          Membership before : ", "$"
	memDuraAfter	DB	" |          Membership left   : ", "$"
	memDuraEnd	DB	"           |", 0dH, 0aH
			DB	" |                                                   |", 0dH, 0aH, "$"
	memDaysDur1	DB	" |---------------------MEMBERSHIP--------------------|", 0dH, 0aH
			DB	" |---------------------DAYS LEFT---------------------|", 0dH, 0aH
			DB	" |          Membership Day(s) Left    : ", "$"
	memDaysDur2	DB	" |          Membership Month(s) Left  : ", "$"
	memDaysDur3	DB	" |          Membership Year(s) Left   : ", "$"
	memDaysEnd1	DB	"           |", 0dH, 0aH, "$"
	memDaysEnd2	DB	"           |", 0dH, 0aH, "$"
	memDaysEnd3	DB	"         |", 0dH, 0aH, "$"
	memFooter	DB	" '---------------------------------------------------'", 0dH, 0aH, "$"
	newMemMsg	DB	"None      ", "$"
	memPrompt1	DB	"Do you want to be a member ? (Y=Yes|N=No|Q=Main Menu) > $"
	memPrompt2	DB	"|_____________________________________________________|", 0dH, 0aH
			DB	"|           Are you a member ? (Y=Yes|N=No)           |", 0dH, 0aH
			DB	"|                                                     |", 0dh, 0ah
			DB	"|                (Q/q = Return to menu)               |", 0dh, 0ah
			DB	"'-----------------------------------------------------'", 0dH, 0aH, "$"
	memPrompt3	DB	"Enter choice here >", "$"
	cancPrompt1	DB  	"Enter choice here >", "$"
	renewPrompt	DB	"Enter Duration of renewal :",0dH, 0aH, "$"
	DuraConfirm	DB	"Confirm date ? (Y=Yes|N=No|Q=return)",0dH, 0aH, "$"
	errorYorN	DB	"Invalid input, Please enter (Y=Yes|N=No)",0dH, 0aH, "$"
	error1or2	DB	"Invalid input, Please enter 1 or 2 only",0dH, 0aH, "$"
	errorMsgDate1	DB	"Invalid input, days out of range",0dH, 0aH, "$"
	errorMsgDate2	DB	"Invalid input, month out of range",0dH, 0aH, "$"
	errorMsgDate3	DB	"Invalid input, year out of range",0dH, 0aH, "$"
	errorOption	DB	"Invalid input, please try again. (Ex. 1)", 0dH, 0aH, "$"
	continueMsg	DB      "Do you wish to continue ? (Y=Yes|N=No) > $"
	addConfirm	DB	"Confirm membership renewal? (Y=Yes|N=No) > $"
	userMem		DB	"When is your membership expiry date ? (DD/MM/YYYY)",0dH, 0aH, "$"
	memContinue	DB	"Do you wish to be in the Membership function ? (Y=Yes|N=No) > $"
	memPay		DB	"Enter amount for payment  RM(Min. 20|Max. 99) :",0dH, 0aH, "$"
	errorMemPayMsg	DB	"Invalid amount. Please try again.",0dH, 0aH, "$"
	memPayBalance	DB	"Balance : RM ", "$"
	memPayGrat	DB	"Thank you for being a member !! Happy Ordering~!", 0dH, 0aH, "$"
	notMemMsg	DB	"Sorry you are not a member. :(", 0dH, 0aH, "$"
	isMemMsg	DB	"You are already a member. :)", 0dh, 0ah, "$"
	pack1mem	DB	"Package Price : RM 20", 0dh, 0ah, "$"
	pack2mem	DB	"Package Price : RM 35", 0dh, 0ah, "$"
	pack3mem	DB	"Package Price : RM 45", 0dh, 0ah, "$"
	inputDate	DB	11	DUP	("$")
	memberPayment	DB	3	DUP	("$")
	inputMem	DB	?
	thousand	DW	1000
	yearDays	DW	365
	defaultYear	DW	2021
	systemDay	DB	?
	systemMonth	DB	?
	systemYear	DW	?
	systemYear1	DB	?
	systemYear2	DB	?
	systemDayB	DB	?
	systemMonthB	DB	?
	systemYearB	DW	?
	systemYearC	DB	?
	systemYearD	DB	?
	userDay		DB	?
	userMonth	DB	?
	userYear	DW	?
	userYear1	DB	?
	userYear2	DB	?
	beforeDay	DB	?
	beforeMonth	DB	?
	beforeYear1	DB	?
	beforeYear2	DB	?
	addMember	DB	0
	monthCount	DB	0
	yearCount	DB	0
	userChoice	DB	?
	quotient1	DW	0
	quotient2	DB	0
	remainder1	DB	0
	remainder2	DB	0
	newMemCount	DB	0
	memDaysLeft	DW	0
	yearLeft	DW	0
	yearLeft1   DB  0
	yearLeft2   DB  0
	monthLeft	DB	0
	dayLeft		DB	0
	memYearsLeft1	DB	0
	memYearsLeft2	DB	0
	memPackage	DW	0
	regisMem	DB	0
	memPayBal	DB	0
	noOrderB	DB	0
	noOrderF	DB	0
	cateCount	DB	0

;---- data for Cancellation
	cancelTable	DB " ._________________________________________________.", 0dH, 0aH
			DB " |___________________CANCELLATION__________________|", 0dH, 0aH
			DB " |-----------------ITEMS-----------------|---Qty---|", 0dH, 0aH, "$"
	cancelTable2	DB " ._________________________________________________.", 0dH, 0aH
			DB " |___________________CANCELLATION__________________|", 0dH, 0aH
			DB " |---------------ITEMS-LEFT--------------|---Qty---|", 0dH, 0aH, "$"
	tableBorder1	DB " |   ", "$"
	tableBorder2	DB "   |", 0dh, 0ah, "$"
	cancelFoot	DB " '-------------------------------------------------'", 0dh, 0ah, "$"
	cancelCate	DB " .________________________________________.", 0dh, 0ah
			DB " |______________CANCELLATION______________|", 0dh, 0ah
			DB " |----------------CATEGORY----------------|", 0dh, 0ah
			DB " |              1. Food                   |", 0dh, 0ah
			DB " |              2. Beverage               |", 0dh, 0ah
			DB " |              3. Return                 |", 0dh, 0ah
			DB " '----------------------------------------'", 0dh, 0ah, "$"
	cancelMsgF	DB " Choose an item to cancel (0__ to return| NL_ for food) : ", 0dh, 0ah, "$"
	cancelMsgB	DB " Choose an item to cancel (0__ to return| D_ for bev) : ", 0dh, 0ah, "$"
	errorCanc	DB " Invalid input, Please try again.", 0dh ,0ah, "$"
	amountPromptC	DB " Enter the amount that you wish to cancel :", 0dh, 0ah, "$"
	cancelConfirm	DB " Confirm cancellation (Y=Yes|N=No)?", 0dh, 0ah, "$"
	cancelDone	DB " Order has been cancelled. Thank you",0dh, 0ah, "$"
	cancelConti	DB " Do you wish to remain in the cancel function ? (Y=Yes|N=No)",0dh, 0ah, "$"
	cancelNoOrder	DB " You have no orders left ! Press to continue.", 0dh, 0ah, "$"
	cancelChoice1	DB	4	DUP	("$")
	cancelChoice2	DB	3	DUP	("$")
	cancelCateFlag	DB 0
	initialCancel	DB 0
	inputCancel	DB ?
	cancelAmount	DB 0
;--- data for Summary
	summary		DB 0dH, 0aH, ".__________________________________________.", 0dH, 0aH
			DB "|_____________OVERALL SUMMARY______________|", 0dH, 0aH, "$"
	memreg   	DB "| 1. Attempt of Registration        - $"
	memlogin	DB "| 2. Attempt of Log In              - $"
	memOrder	DB "| 3. Attempt of Member Ordering     - $"
	guestOrder	DB "| 4. Attempt of Non-member Ordering - $"
	canOrder	DB "| 5. Attempt of Order Cancellation  - $"
	restockMsg	DB "| 6. Attempt of Restocking          - $"
	priceAdjust	DB "| 7. Attempt of Price Adjustment    - $"
	reporting	DB "| 8. Attempt of Report Generation   - $"
	space3		DB "   |", 0dH, 0aH, "$"
	summaryL	DB "'------------------------------------------'", 0dH, 0aH, "$"
	numofMemO	DB 0
	numofGuestO	DB 0
	numofReg	DB 0
	numofPA		DB 0
	numofReport	DB 0
	numofCancel	DB 0
	numofRestock	DB 0
	numofLogin	DB 0
		
.CODE
MAIN PROC
	mov ax,@data
	mov ds, ax
 	MOV AH, 0    ; set video mode   
        MOV AL, 2    ; set row cols 80 x 26
        INT 10H
startingP:

      mov ah, 09h
      lea dx, logo
      int 21h

mainPage:

	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

      mov ah, 09h
      lea dx, logo
      int 21h

      mov ah, 09h
      lea dx, firstPage
      int 21h

      mov ah, 01h
      int 21h
      mov choosen, al

	mov ah, 09h
	lea dx, nextline
	int 21h

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je continue1
	cmp al, "y"
	je continue1
	cmp al, "N"
	je mainPage
	cmp al, "n"
	je mainPage
	jne wrongchar

continue1:
      CMP choosen, "1"
      JE lgnPage
      CMP choosen, "2"
      JE registerPage1
      CMP choosen, "3"
      JE guestPage1
      CMP choosen, "4"
      JE exit1
      JNE wrongNum

wrongNum:

      mov ah, 09h
      lea dx, failmsg
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 01h
      int 21h

      jmp mainPage

wrongchar:
      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 09h
      lea dx, eromsgconf
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 01h
      int 21h

      jmp mainPage

lgnPage:
      JMP loginPage
guestPage1:
      JMP guestPage
registerPage1:
      JMP registerPage
exit1:
	jmp sumry

      ;----------------------------------------------register page
registerPage:

      mov ah, 09h
      lea dx, secondPage
      int 21h

      JMP member2

nameRegis:

      mov nameinput, 0
      mov ah, 09h
      lea dx, rgt1
      int 21h

      mov ah, 0Ah
      lea dx, namelist
      int 21h

      JMP validatename

validatename:

      mov ah, 09h
      lea dx, rgtconf1
      int 21h

      mov choosergt, 0
      mov ah, 01H
      int 21H
      mov choosergt, al

      cmp al, "Y"
      je goodname
      cmp al, "y"
      je goodname
      cmp al, "N"
      je nameRegis
      cmp al, "n"
      je nameRegis
      jne salah

goodname:

      mov ah, 09h
      lea dx, rgt5
      int 21h

      mov ah, 09h
      lea dx, nameinput
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov al, actname
      cmp al, 3
      jl errorname
      jge icRegis

salah:

      mov ah, 09h
      lea dx, salahinsert
      int 21h
      jmp validatename

errorname:

      mov ah, 09h
      lea dx, salahname
      int 21h
      jmp nameRegis

icRegis:

      mov icinput, 0
      mov ah, 09h
      lea dx, rgt2
      int 21h

      mov ah, 0Ah
      lea dx, iclist
      int 21h

      JMP validateic

validateic:

      mov ah, 09h
      lea dx, rgtconf2
      int 21h

      mov choosergt, 0
      mov ah, 01H
      int 21H
      mov choosergt, al


      cmp al, "Y"
      je goodic
      cmp al, "y"
      je goodic
      cmp al, "N"
      je icRegis
      cmp al, "n"
      je icRegis
      jne salah1

salah1:

      mov ah, 09h
      lea dx, salahinsert
      int 21h
      jmp validateic

goodic:

      mov ah, 09h
      lea dx, rgt6
      int 21h

      mov ah, 09h
      lea dx, icinput
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov al, actic
      cmp al, 12
      jl erroric
      jge phoneRegis

erroric:

      mov ah, 09h
      lea dx, salahic
      int 21h
      jmp icRegis

phoneRegis:

      mov phoneinput, 0
      mov ah, 09h
      lea dx, rgt3
      int 21h

      mov ah, 0Ah
      lea dx, phonelist
      int 21h

      JMP validatephone

validatephone:

      mov ah, 09h
      lea dx, rgtconf3
      int 21h

      mov choosergt, 0
      mov ah, 01H
      int 21H
      mov choosergt, al

      cmp al, "Y"
      je goodphone
      cmp al, "y"
      je goodphone
      cmp al, "N"
      je phoneRegis
      cmp al, "n"
      je phoneRegis
      jne salah2

salah2:

      mov ah, 09h
      lea dx, salahinsert
      int 21h
      jmp validatephone

goodphone:

      mov ah, 09h
      lea dx, rgt7
      int 21h

      mov ah, 09h
      lea dx, phoneinput
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov al, actphone
      cmp al, 10
      jl errorphone
      jge cipherRegis

errorphone:

      mov ah, 09h
      lea dx, salahphone
      int 21h
      jmp phoneRegis


cipherRegis:

      mov cipherinput, 0
      mov ah, 09h
      lea dx, rgt4
      int 21h

      mov ah, 0Ah
      lea dx, cipherlist
      int 21h

      JMP validatecipher

validatecipher:

      mov ah, 09h
      lea dx, rgtconf4
      int 21h

      mov choosergt, 0
      mov ah, 01H
      int 21H
      mov choosergt, al

      cmp al, "Y"
      je goodcipher
      cmp al, "y"
      je goodcipher
      cmp al, "N"
      je cipherRegis
      cmp al, "n"
      je cipherRegis
      jne salah3

salah3:

      mov ah, 09h
      lea dx, salahinsert
      int 21h
      jmp validatecipher

goodcipher:

      mov ah, 09h
      lea dx, rgt8
      int 21h

      mov ah, 09h
      lea dx, cipherinput
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov al, actcipher
      cmp al, 8
      jl errorcipher
      jge checkdetails

errorcipher:

      mov ah, 09h
      lea dx, salahpass
      int 21h
      jmp cipherRegis


checkdetails:

      mov ah, 09h
      lea dx, nextLine
      int 21h

      mov ah, 09h
      lea dx, rgt5
      int 21h

      mov ah, 09h
      lea dx, nameinput
      int 21h

      mov ah, 09h
      lea dx, rgt6
      int 21h

      mov ah, 09h
      lea dx, icinput
      int 21h

      mov ah, 09h
      lea dx, rgt7
      int 21h

      mov ah, 09h
      lea dx, phoneinput
      int 21h

      mov ah, 09h
      lea dx, rgt8
      int 21h

      mov ah, 09h
      lea dx, cipherinput
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      JMP makeconfirm

makeconfirm:

      mov ah, 09h
      lea dx, confirmrgt
      int 21h

      mov choosergt, 0
      mov ah, 01h
      int 21h
      mov choosergt, al

      cmp choosergt, "Y"
      je rgtdone
      cmp choosergt, "y"
      je rgtdone
      cmp choosergt, "N"
      je rgtfail
      cmp choosergt, "n"
      je rgtfail
      jne wrgtype


rgtdone:

      inc numofGuestO
      mov ah, 09h
      lea dx, rgt9
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 01h
      int 21h
      inc numofReg
      jmp mainPage1

rgtfail:

      mov nameinput, 0
      mov icinput, 0
      mov phoneinput, 0
      mov cipherinput, 0

      mov ah, 09h
      lea dx, rgt10
      int 21h

      mov ah, 09h
      lea dx, nextline
      int 21h

      mov ah, 01h
      int 21h

      jmp mainPage1

wrgtype:

      mov ah, 09h
      lea dx, salahinsert
      int 21h

      JMP makeconfirm

mainPage1:
      JMP mainPage

      ;----------------------------------------register page end

      ;-----------------------------------------------login page
loginPage:

	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

      mov ah, 09h
      lea dx, thirdPage
      int 21h

      CALL lgnIC

lgnIC:

        mov ah, 09h
        lea dx, lgn1
        int 21h

        mov ah, 0Ah
        lea dx, UserN
        int 21h

        mov cx, 12
        mov si, 0

roomer:
        mov al, inputN[si]
        cmp al, icinput[si]
        JNE staffname
        inc si
        LOOP roomer

        JMP lgnCipher

staffname:

        mov cx, 5
        mov si, 0

actstaff:
        mov al, inputN[si]
        cmp al, staffID[si]
        JNE failIcnum
        inc si
        LOOP actstaff

        JMP loginfinish12

failIcnum:

        mov ah, 09h
        lea dx, lgn3
        int 21h

        mov ah, 09h
        lea dx, nextline
        int 21h

        mov ah, 01h
        int 21h

        jmp mainPage2


lgnCipher:

        mov ah, 09h
        lea dx, lgn2
        int 21h

        mov ah, 0Ah
        lea dx, UserX
        int 21h

        mov cx, 15
        mov si, 0
        
summer:
        mov al, inputX[si]
        cmp al, cipherinput[si]
        JNE failCipher
        inc si
        LOOP summer

        JMP finishlogin

failCipher:

        mov ah, 09h
        lea dx, lgn4
        int 21h

        mov ah, 09h
        lea dx, nextline
        int 21h

        mov ah, 01h
        int 21h

        jmp mainPage2


mainPage2:
        JMP mainPage

finishlogin:

	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
        inc numofLogin
        mov ah, 09h
        lea dx, validate
        int 21h

        mov ah, 09h
        lea dx, nextline
        int 21h

        mov ah, 09h
        lea dx, logo
        int 21h

        JMP customerModule

customerModule:
	mov ah, 09H
	lea dx, CustomerMenu
	int 21H

	mov ah, 09H
	lea dx, customerPrompt
	int 21H

	mov ah, 01H
	int 21H
	mov input, al
	;--- Confirmation
	mov ah, 09H
	lea dx, newline
	int 21H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je CC01
	cmp al, "y"
	je CC01
	cmp al, "N"
	je customerModule
	cmp al, "n"
	je customerModule
	jne Cerror

Cerror:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp customerModule

CC01:
	cmp input, "1"
	jl custError
	je custOrder
	cmp input, "2"
	je member76
	cmp input, "3"
	jg custError
	je BF765

custError:
	mov ah, 09H
	lea dx, chk1n2
	int 21H
	jmp customerModule

custOrder:
	jmp Momenu
member76:
        jmp member
BF765:
        jmp BF

loginfinish12:
        inc numofLogin
        mov ah, 09h
        lea dx, validatestaff
        int 21h

        JMP staffModule

staffModule:

        jmp staffM
        ;------------------------------------login page end



        ;----------------------------------------------- Guest page start

guestPage:

	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ifMem, 0
        mov ah, 09h
        lea dx, gut
        int 21h

        mov ah, 09h
        lea dx, nextline
        int 21h

        mov ah, 09h
        lea dx, logo
        int 21h


        JMP Momenu
        ;------------------------------------Guest page end
BF:
	jmp startingP
;--------------------------------- MEMBERSHIP	
	member:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
memberRet:
	mov userChoice, 0
	mov addMember, 0
	mov monthCount, 0
	mov yearCount, 0
	mov cateCount, 1
	mov inputMem, 0

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, newLine
	int 21h
	lea dx, memStart
	int 21h
	mov ah, 09h
	lea dx, memPrompt2	;--- Prompt Membership status
	int 21h
	lea dx, memPrompt3
	int 21h
	mov ah, 01H
	int 21h
	mov proceed, al
	mov ah, 02h
	mov dx, newLine
	int 21h

;--- Input validation for Yes / No
	cmp proceed, "Y"
	je categoryMemjmp
	cmp proceed, 'N'
	je newOptJmp3
	cmp proceed, 'y'
	je categoryMemjmp
	cmp proceed, 'n'
	je newOptJmp3
	cmp proceed, 'q'
	je mainMenujmpA
	cmp proceed, 'Q'
	je mainMenujmpA
	jne proceedError01

proceedError01:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H
	JMP member

mainMenujmpA: JMP customerModule
newOptJmp3 : JMP isMemCheck
newOptJmp2: JMP systemtime
categoryMemjmp: JMP categoryMemjmpB
errorIsMemjmp: JMP errorIsMem
errorNotMemjmp: JMP errorNotMem

categoryMemjmpB:
	cmp ifMem, 0
	JE errorNotMemjmp
	JMP categoryMem

isMemCheck:
	cmp regisMem, 0
	JG errorIsMemjmp
	JMP systemtime

member2:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov proceed, 0
	mov cateCount, 0
	mov memberPayment, 0
	mov ah, 09H
	lea dx, newLine
	int 21H
	mov ah, 09H
	lea dx, memPrompt1 ;---- Membership approval
	int 21H
	mov ah, 01H
	int 21h
	mov proceed, al

;--- Input validation for Yes / No
	cmp proceed, 'Y'
	je newOptJmp1
	cmp proceed, 'N'
	je thenamejmp
	cmp proceed, 'y'
	je newOptJmp1
	cmp proceed, 'n'
	je thenamejmp
	cmp proceed, 'q'
	je mainMenujmp
	cmp proceed, 'Q'
	je mainMenujmp
	jne proceedError02

proceedError02:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H

newOptJmp1:
	mov ifMem, 1
	inc regisMem
	JMP newOptJmp2

thenamejmp: 
	mov ifMem, 0
	JMP nameRegis

mainMenujmp: JMP mainPage
terminate1: JMP exit

;--- User with member category selection
	categoryMem:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov regisMem, 0
	mov userChoice, 0
	mov cateCount, 1
	mov ah, 09h
	lea dx, memHeader
	int 21h
	lea dx, memCate
	int 21h
	lea dx, memFooter
	int 21h
	mov ah, 01h
	int 21h
	sub al, 30h
	mov userChoice, al
	mov ah, 02h
	mov dx, newLine
	int 21h

	cmp userChoice, 1
	JL errorOptB
	JE newMem
	JG cate2
cate2:  cmp userChoice, 2
	JE beforeDatejmp
	JG errorOptB

beforeDatejmp: JMP beforeDate
errorOptB: JMP errorOpt2
errorMem1: JMP errorDate1
error2: JMP errorDate2

;---- Get user's membership expiry date
	newMem:
	mov newMemCount, 0
	mov ah, 09h
	lea dx, userMem
	int 21h
	
	mov bx, 0
   	mov cx, 10

	repeat:
   	mov ah, 01h
   	int 21h
	sub al, 30h
   	mov inputDate[bx], al
   	inc bx
	loop repeat
	
	mov ah, 02h	
	mov dx, newLine 
	int 21h

;---- Validate user's input of date
	sub bx, bx

	mov ax, 0
	mov al, inputDate[bx]
	mul ten
	inc bx
	add al, inputDate[bx]
	cmp al, 1
	JL errorMem1
	cmp al, 31
	JG errorMem1
	mov userDay, al

	add bx, 2
	mov al, 0
	mov al, inputDate[bx]
	mul ten
	inc bx
	add al, inputDate[bx]
	cmp al, 1
	JL error2
	cmp al, 12
	JG error2
	mov userMonth, al
	JMP daysInMonth

	validYear:
	add bx, 2
	mov cx, 3

	mov ax, 0
	mov al, inputDate[bx]
	Memyear:
	mul ten
	inc bx
	add al, inputDate[bx]
	loop Memyear

	cmp ax, defaultYear
	JNGE error3
	mov userYear, ax

	mov ax, 0
	mov cl, 0
	mov ax, userYear
	mov cl, hundred
	div cl
	mov userYear2, ah
	mov userYear1, al

proceedDuraMem:
	mov ah, 02h
	mov dx, newLine
	int 21h
	mov ah, 09h
	lea dx, DuraConfirm
	int 21h
	mov ah, 01H
	int 21h
	mov proceed, al
	mov ah, 02h
	mov dx, newLine
	int 21h

;--- Input validation for Yes / No
	cmp proceed, "Y"
	je proceedMem
	cmp proceed, 'N'
	je categoryMemjmpC
	cmp proceed, 'y'
	je proceedMem
	cmp proceed, 'n'
	je categoryMemjmpC
	cmp proceed, 'q'
	je categoryMemjmpC
	cmp proceed, 'Q'
	je categoryMemjmpC
	jne proceedError00

error3: JMP errorDate3
categoryMemjmpC: JMP categoryMem

proceedError00:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
	JMP proceedDuraMem

proceedMem:
	cmp userChoice, 1
	JE systemtime2jmp

systemtime2jmp: JMP systemtime2
;--- Validate number of days in a month

		daysInMonth:
		cmp userMonth, 2 ;feb
		JE twentyNine
		JG nextMonth1
nextMonth1:	cmp userMonth, 4 ;april
		JE thirty
		JG nextMonth2
nextMonth2:	cmp userMonth, 6 ;june
		JE thirty
		JG nextMonth3
nextMonth3:	cmp userMonth, 9 ;september
		JE thirty
		JG nextMonth4
nextMonth4:	cmp userMonth, 11 ;november
		JE thirty
		JMP validYear

	twentyNine:
	cmp userDay, 29
	JG errorMemA
	JLE validYearA

	thirty:
	cmp userDay, 30
	JG errorMemA
	JLE validYearA

errorMemA: JMP errorDate1
validYearA: JMP validYear

	beforeDate:
	mov al, 0
	mov al, systemDay
	mov beforeDay, al
	mov al, 0
	mov al, systemMonth
	mov beforeMonth, al
	mov al, 0
	mov al, systemYear1
	mov beforeYear1, al
	mov al, 0
	mov al, systemYear2
	mov beforeYear2, al
	JMP newOpt

	systemtime:
	mov ah, 2Ah
	int 21h
	mov systemDay, dl
	mov systemMonth, dh
	mov systemYear, cx
	mov dx, 0
	mov cx, 0
	mov ax, 0
	mov ax, systemYear
	mov cl, hundred
	div cl
	mov systemYear2, ah
	mov systemYear1, al
	JMP newOpt

	systemtime2:
	mov ah, 2Ah
	int 21h
	mov systemDayB, dl
	mov systemMonthB, dh
	mov systemYearB, cx
	mov dx, 0
	mov cx, 0
	mov ax, 0
	mov ax, systemYearB
	mov cl, hundred
	div cl
	mov systemYearD, ah
	mov systemYearC, al
	JMP memDur

;---- Membership duration calculation
	memDur:
	mov regisMem, 1
	mov ax, 0
	mov dx, 0
	mov ax, userYear
	sub ax, systemYearB
	mov yearLeft, ax

	mov ax, 0
	mov dx, 0
	mov al, userMonth
	cmp al, systemMonthB
	JL incMonth
	JGE subMonth
subMonth:
	sub al, systemMonthB
	mov monthLeft, al

	mov dx, 0
	mov ax, 0
	mov al, userDay
	cmp al, systemDayB
	JL zeroDay
	JGE subDay
subDay:	sub al, systemDayB
	mov dayLeft, al
	JMP displayDuration

	incMonth:
	add al, 12
	sub yearLeft, 1  
	JMP subMonth

	zeroDay:
	sub monthLeft, 1
	JMP monthDaysCount

	monthDaysCount:
	cmp userMonth, 12
	JE thirtyOneDur
	JL dayNex1
dayNex1:cmp userMonth, 11
	JE thirtyDur
	JL dayNex2
dayNex2:cmp userMonth, 10
	JE thirtyOneDur
	JL dayNex3
dayNex3:cmp userMonth, 9
	JE thirtyDur
	JL dayNex4
dayNex4:cmp userMonth, 8
	JE thirtyOneDur
	JL dayNex5
dayNex5:cmp userMonth, 7
	JE thirtyOneDur
	JL dayNex6
dayNex6:cmp userMonth, 6
	JE thirtyDur
	JL dayNex7
dayNex7:cmp userMonth, 5
	JE thirtyOneDur
	JL dayNex8
dayNex8:cmp userMonth, 4
	JE thirtyDur
	JL dayNex9
dayNex9:cmp userMonth, 3
	JE thirtyOneDur
	JL dayNex10
dayNex10:cmp userMonth, 2
	JE twentyEightDur
	JL dayNex11
dayNex11:cmp userMonth, 1
	JE thirtyOneDur

	thirtyOneDur:
	add al, 31
	JMP subDay

	thirtyDur:
	add al, 30
	JMP subDay

	twentyEightDur:
	add al, 28
	JMP subDay

;--- Displaying membership duration left in days, months and years
	displayDuration:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, memDaysDur1
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, dayLeft
	div TEN
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 09h
	lea dx, memDaysEnd1
	int 21h
	lea dx, memDaysDur2
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, monthLeft
	div TEN
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 09h
	lea dx, memDaysEnd2
	int 21h
	lea dx, memDaysDur3
	int 21h

	mov cx, 0
	mov dl, 0
	mov ax, 0
	mov ax, yearLeft
	div HUNDRED
	mov yearLeft2, ah
	mov yearLeft1, al

	mov cx, 0
	mov dl, 0
	mov ax, 0
	mov al, yearLeft1
	div TEN
	mov cl, al
	mov ch, ah

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov cx, 0
	mov dl, 0
	mov ax, 0
	mov al, yearLeft2
	div TEN
	mov cl, al
	mov ch, ah

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 09h
	lea dx, memDaysEnd3
	int 21h
	lea dx, memFooter
	int 21h
	JMP memConti

;---- Display membership renewal options
	newOpt:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, newLine
	int 21H
	mov ah, 09h
	lea dx, memHeader
	int 21h
	lea dx, memRenew
	int 21h
	lea dx, memFooter
	int 21h
	lea dx, renewPrompt
	int 21h
	mov al, 0
	mov ah, 01h
	int 21h
	sub al, 30h
	mov userChoice, al
	mov ah, 02h	
	mov dx, newLine
	int 21h

	cmp userChoice, 1
	JL errorOptA
	JE threeMonth
	JG newSix
newSix: cmp userChoice, 2
	JE sixMonth
	JG newYear
newYear:cmp userChoice, 3
	JE oneYear
	JG rtnJmp
rtnJmp:	cmp userChoice, 4
	JE memberRtn
	JG errorOptA

memberRtn: 
	cmp ifMem, 0
	JE memberjmpZ
	JNE customerModulejmp

memberjmpz: JMP member
customerModulejmp: JMP mainPage
errorOptA: JMP errorOpt1

;--- Prepare for membership renewal calculation
	threeMonth:
	mov addMember, 3
	mov monthCount, 1
	JMP confirm

	sixMonth:
	mov addMember, 6
	mov monthCount, 1
	JMP confirm

	oneYear:
	mov addMember, 1
	mov yearCount, 1
	JMP confirm

;--- Prompt user confirmation of renewal
	confirm:
	mov inputMem, 0
	mov ah, 09h
	lea dx, addConfirm
	int 21h
	mov ah, 01h
	int 21h
	mov inputMem, al
	mov ah, 02h
	mov dx, newLine
	int 21h

	cmp cateCount, 1
	JE oldMemPrompt

newMemPrompt:
	cmp inputMem, 'Y'
	je newMemChk
	cmp inputMem, 'N'	
	je thenamejmp2
	cmp inputMem, 'y'
	je newMemChk
	cmp inputMem, 'n'
	je thenamejmp2
	jne errorConfirmA

thenamejmp2: JMP nameRegis

oldMemPrompt:
	cmp inputMem, 'Y'
	je newMemChk
	cmp inputMem, 'N'	
	je terminate2
	cmp inputMem, 'y'
	je newMemChk
	cmp inputMem, 'n'
	je terminate2
	jne errorConfirmA

	newMemChk:
	cmp regisMem, 0
	JG addNewMemjmp
	JE addMem

addNewMemjmp:  JMP addNewMem
errorConfirmA: JMP errorConfirm
terminate2:    JMP memConti

;--- Membership renewal calculation
	addMem:
	cmp monthCount, 1
	JE addMonth
	JNE yearC
yearC:	cmp yearCount, 1
	JE addYear

	addMonth:
	mov al, 0
	mov al, systemMonth
	add al, addMember
	mov systemMonth, al
	cmp systemMonth, 12
	JG extraMonth
	JLE addPacPrice

	addYear:
	mov al, systemYear2
	add al, addMember
	mov systemYear2, al
	JMP addPacPrice

	extraMonth:
	sub systemMonth, 12
	add systemYear2, 1
	JMP addPacPrice

addPacPrice:
	cmp monthCount, 1
	JE monthMember
	JNE valiPac
valiPac:
	cmp yearCount, 1
	JE yearMember

monthMember:	cmp addMember, 3
		JE memPacAdd3
		JNE addMemberConti
addMemberConti: cmp addMember, 6
		JE memPacAdd6

memPacAdd3:     mov memPackage, 20
	        JMP displayMem

memPacAdd6:     mov memPackage, 35
	        JMP displayMem

yearMember:     mov memPackage, 45
	        JMP displayMem

;--- Membership calculation for non-members
	addNewMem:
	cmp monthCount, 1
	JE addMonthNew
	JNE yearD
yearD:	cmp yearCount, 1
	JE addYearNew

	addMonthNew:
	mov al, 0
	mov al, systemMonth
	add al, addMember
	mov systemMonth, al
	cmp systemMonth, 12
	JG extraMonthNew
	JLE addPacPrice2

	addYearNew:
	mov al, systemYear2
	add al, addMember
	mov systemYear2, al
	JMP addPacPrice2

	extraMonthNew:
	sub systemMonth, 12
	add systemYear2, 1
	JMP addPacPrice2

;--- Add price of member into cart
addPacPrice2:
	cmp monthCount, 1
	JE monthMember2
	JNE valiPac2
valiPac2:cmp yearCount, 1
	JE yearMember2

monthMember2:	
		cmp addMember, 3
		JE newMemPacAdd3
		JNE addMemberConti2
addMemberConti2:cmp addMember, 6
		JE newMemPacAdd6

newMemPacAdd3: 
			mov memPackage, 20
	       	JMP displayMem

newMemPacAdd6:  
			mov memPackage, 35
	        JMP displayMem

yearMember2:    
			mov memPackage, 45
	        JMP displayMem

addNewJmp: JMP addMem

;--- Display membership renewal before and after
	displayMem:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, memHeader
	int 21h
	lea dx, memDuraBefore
	int 21h	

	cmp beforeDay, 0
	JNE withMemDisplay

noneMemDisplay:
	
	mov ah, 09h
	lea dx, newMemMsg
	int 21h
	JMP memAfterDisplay

withMemDisplay:
	mov ax, 0
	mov cx, 0
	mov dl, 0
	mov al, beforeDay
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al
	
	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 02h
	mov dx, 2Fh
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, beforeMonth
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov cx, 0
	mov ah, 02h
	mov dx, 2Fh
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, beforeYear1
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h
	
	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, beforeYear2
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

memAfterDisplay:
	mov ah, 09h
	lea dx, memDuraEnd
	int 21h
	lea dx, memDuraAfter
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, systemDay
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al
	
	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 02h
	mov dx, 2Fh
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, systemMonth
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov cx, 0
	mov ah, 02h
	mov dx, 2Fh
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, systemYear1
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ax, 0
	mov ch, 0
	mov dl, 0
	mov al, systemYear2
	mov cl, 10
	div cl
	mov ch, ah
	mov cl, al

	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
	mov dl, ch
	add dl, 30h
	int 21h

	mov ah, 09h
	lea dx, memDuraEnd
	int 21h
	lea dx, memFooter
	int 21h

	cmp userChoice, 1
	JE memPackA
	cmp userChoice, 2
	JE memPackB

	mov ah, 09h
	lea dx, pack3mem
	int 21h
	JMP memPayment

memPackA:
	mov ah, 09h
	lea dx, pack1mem
	int 21h
	JMP memPayment

memPackB:
	mov ah, 09h
	lea dx, pack2mem
	int 21h
	JMP memPayment

;--- Membership Payment for new users
memPayment:
	cmp cateCount, 1
	JGE addRegisMem

memPayment2:
	mov ax, 0
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, memPay
	int 21h
	JMP memPaymentA

addRegisMem:
	mov regisMem, 1
	JMP memPayment2

memPaymentA:
	mov memberPayment, 0
	mov cx, 2
	mov si, 0

memPayLoop:
	mov ah, 01h
	int 21h
	sub al, 30h
	mov memberPayment[si], al
	inc si
	loop memPayLoop

	mov bx, 0
	mov al, memberPayment[bx]
	mul ten
	inc bx
	add al, memberPayment[bx]

	sub ax, memPackage
	mov memPayBal, al
	cmp ax, 0
	JGE memPaymentB
	JL errorMemPayA

memPaymentB:
	mov ifMem, 1
	mov ah, 0
	mov al, memPayBal
	div ten
	mov ch, ah
	mov cl, al
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, memPayBalance
	int 21h
	cmp cl, 0
	JE memZero
	mov ah, 02h
	mov dl, cl
	add dl, 30h
	int 21h
memZero:
	inc numOfMemO
	mov ah, 02h
	mov dl, ch
	add dl, 30h
	int 21h
	mov ah, 02h
	mov dx, '.'
	int 21h
	mov ah, 02h
	mov dx, 30h
	int 21h
	mov ah, 02h
	mov dx, 30h
	int 21h
	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, memPayGrat
	int 21h
	lea dx, newLine
	int 21h
	mov ah, 01h
	int 21h

	cmp cateCount, 1
	JE memConti
	JNE nameRegis2

errorMemPayA: JMP errorMemPay
nameRegis2: 
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
	JMP nameRegis

mainMenuJ: JMP mainPage

newExpDate:
	memConti:
	mov inputMem, 0
	mov ah, 09h
	lea dx, memContinue
	int 21h
	mov ah, 01h
	int 21h
	mov inputMem, al
	mov ah, 02h
	mov dx, newLine
	int 21h

	cmp inputMem, 'Y'
	je approveConti
	cmp inputMem, 'N'	
	je deniedConti
	cmp inputMem, 'y'
	je approveConti
	cmp inputMem, 'n'
	je deniedConti
	jne errorExpDate

approveConti: JMP member
deniedConti: JMP customerModule

;---- Error message

	errorConfirm:
	mov ah, 09h
	lea dx, errorYorN
	int 21h
	JMP confirm

	errorConfirm1:
	mov ah, 09h
	lea dx, errorYorN
	int 21h
	JMP memConti

	errorExpDate:
	mov ah, 09h
	lea dx, errorYorN
	int 21h
	JMP newExpDate

	errorDate1:
	mov ah, 09h
	lea dx, errorMsgDate1	;day
	int 21h
	JMP newMem

	errorDate2:
	mov ah, 09h
	lea dx, errorMsgDate2	;month
	int 21h
	JMP newMem

	errorDate3:
	mov ah, 09h
	lea dx, errorMsgDate3	;year
	int 21h
	JMP newMem

	errorOpt1:
	mov ah, 09h
	lea dx, errorOption
	int 21h
	JMP newOpt

	errorOpt2:
	mov ah, 09h
	lea dx, errorOption
	int 21h
	JMP categoryMem

	errorMemPay:
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, errorMemPayMsg
	int 21h
	JMP memPaymentA

	errorNotMem:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, notMemMsg
	int 21h
	JMP memberRet

	errorIsMem:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, isMemMsg
	int 21h
	JMP memberRet

;------------ Display order menu
Momenu:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, order
	int 21H
	jmp orderOption
OMenu:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, order
	int 21H
	jmp orderOption

orderOption:
	mov bqty[0], 0
	mov bqty[1], 0
	mov bqty[2], 0
	mov bqty[3], 0
	mov fqty[0], 0
	mov fqty[1], 0
	mov fqty[2], 0
	mov subtf[0], 0
	mov subtdf[0],0
	mov subtf[1], 0
	mov subtdf[1],0
	mov subtf[2], 0
	mov subtdf[2],0
	mov subtb[0], 0
	mov subtdb[0],0
	mov subtb[1], 0
	mov subtdb[1],0
	mov subtb[2], 0
	mov subtdb[2],0
	mov subtb[3], 0
	mov subtdb[3],0
	mov total, 0
	mov totalD, 0
	mov sst, 0
	mov sstd, 0
	mov disc, 0
	mov discD, 0
	mov pack, 0
	mov packD, 0

	mov ah, 09H
	lea dx, newLine
	int 21H

	;------ Prompt order option
	mov ah, 09H
	lea dx, ostate
	int 21H

	;------ Get user order option
	mov ah, 01H
	int 21H
	sub al, 30H

	;------ Validate input range
	cmp al, 0
	jle errormsgo
	cmp al, 5
	jge errormsgo

	mov cx, 0
	mov cl, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;------ Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate input range
	cmp al, "Y"
	je skip3
	cmp al, "y"
	je skip3
	cmp al, "N"
	je orderOpt
	cmp al, "n"
	je orderOpt
	jne errormsgo1
orderOpt:
	jmp orderOption
L137:
	jmp startingP
skip3:
	mov onum, cl	; store onum
	cmp onum, 4
	je L137

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp FMenu	; Go to Food Menu

;------ Order error message 
errormsgo:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgo
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderOption	; Loop to prompt and read again

;------ Order Confirmation error message 
errormsgo1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	jmp orderOption	; Loop to prompt and read again

;------------ Display food menu
FMenu:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, menuH
	int 21H

	mov ah, 09H
	lea dx, food
	int 21H

	;------ Display food1
	mov si, offset fprice
	mov di, offset fpriceD

	mov ah, 09H
	lea dx, food1
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Display food2
	mov ah, 09H
	lea dx, food2
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Display food3
	mov ah, 09H
	lea dx, food3
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	mov ah, 09h
	lea dx, menuL
	int 21h

;------ if(bx == 11), back to adjustment module(BAM), else continue(C)
	cmp bx, 11
	je BAM
	jne C
BAM:	jmp aMenu

C:	
;------ Get user food order
orderf:
	mov ah, 09H
	lea dx, fstate
	int 21h

	mov ah, 02H
	mov dl, "N"
	int 21h

	mov ah, 02H
	mov dl, "L"
	int 21h

	mov ax, 0
	mov si, 0
	mov di, 0

	mov ah, 01H
	int 21h
	sub al, 30H

	mov cx, 3

	cmp al, 0
	je L3
	cmp al, 0
	jl errormsgf
	cmp al, 4
	jge errormsgf

L2:
	cmp fnum[si], al
	je famount
	inc si
	inc di
	loop L2

L3:
	mov input1, al
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp BMenu

errormsgf:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgf
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderf

errormsgf1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderf

famount:
	mov ah, 02H
	mov dl, ","
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H

	add di, si

	cmp al, 0
	jle errormsgf
	cmp al, 9
	jg errormsgf
	mov ah, 0
	cmp fsqty[di], ax
	jl errormsg3
	cmp fsqty[di], 0
	je errormsg1
	sub fsqty[di], ax
	
	mov cx, 0
	mov cl, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;--- Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R1
	cmp al, "y"
	je R1
	cmp al, "N"
	je L4
	cmp al, "n"
	je L4
	jne errormsgf1
R1:
	add fqty[si], cl
	add qtyNL[si], cl
	cmp qtyNL[si], 100
	jge addH1
	jl skip1
addH1:	
	sub qtyNL[si], 100
	inc qtyNLH[si]	
skip1:
	jmp faddon
L4:
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderf

errormsg1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, nomorefood
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderf

errormsg3:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, nomorefood1
	int 21H

	mov ax, fsqty[di]
	div ten
	add ah, 30H
	mov remainder, ah
	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderf

faddon:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ax, 0
	mov ah, 09H
	lea dx, addOn
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je f1
	cmp al, "y"
	je f1
	cmp al, "N"
	je BMenu
	cmp al, "n"
	je BMenu

	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H
	jmp faddon
f1:
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderf

;------------ Display beverage menu
BMenu:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, menuH
	int 21H

	mov ah, 09H
	lea dx, beverage
	int 21H

	;------ Display beverage1
	mov si, offset bprice
	mov di, offset bpriceD

	mov ah, 09H
	lea dx, beverage1
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Display beverage2
	mov ah, 09H
	lea dx, beverage2
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Display beverage3
	mov ah, 09H
	lea dx, beverage3
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Display beverage4
	mov ah, 09H
	lea dx, beverage4
	int 21H
	call Displayprice
	mov ah, 09H
	lea dx, menuE
	int 21H

	mov ah, 09h
	lea dx, menuL
	int 21h

;------ if(bx == 12), back to adjustment module(BAM), else continue(C)
	cmp bx, 12
	je BAM1
	jne C3
BAM1:	jmp aMenu

C3:
;------ Get user beverage order
orderb:
	mov ah, 09H
	lea dx, bstate
	int 21H

	mov ah, 02H
	mov dl, "D"
	int 21H

	mov ax, 0
	mov si, 0
	mov di, 0

	mov ah, 01H
	int 21H
	sub al, 30H
	mov cx, 4

	cmp al, 0
	je L7
	cmp al, 0
	jl errormsgb
	cmp al, 5
	jge errormsgb

L6:
	cmp bnum[si], al
	je bamount
	inc si
	inc di
	loop L6

L7:
	cmp al, input1
	je L5
search1:
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp MMenu

L5:
	mov bx, 0
	mov cx, 3
search:
	cmp fqty[bx], 0
	jne search1
	inc bx
	loop search

	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp startingP

errormsgb:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgb
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp orderb

errormsgb1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderb

bamount:
	mov ah, 02H
	mov dl, ","
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H

	add di, si

	cmp al, 0
	jle errormsgb
	cmp al, 9
	jg errormsgb
	mov ah, 0
	cmp bsqty[di], ax
	jl errormsg4
	cmp bsqty[di], 0
	je errormsg2
	sub bsqty[di], ax

	mov cx, 0
	mov cl, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;--- Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R2
	cmp al, "y"
	je R2
	cmp al, "N"
	je L8
	cmp al, "n"
	je L8
	jne errormsgb1
R2:
	add bqty[si], cl
	add qtyD[si], cl
	cmp qtyD[si], 100
	jge addH
	jl skip2
addH:	
	sub qtyD[si], 100
	inc qtyDH[si]	
skip2:
	jmp baddon
L8:
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderb

errormsg2:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, nomorefood
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderb

errormsg4:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, nomorefood1
	int 21H

	mov ah, 02H
	mov dx, bsqty[di]
	add dx, 30H
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderf

baddon:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ax, 0
	mov ah, 09H
	lea dx, addOn
	int 21h

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je b1
	cmp al, "y"
	je b1
	cmp al, "N"
	je MMenu
	cmp al, "n"
	je MMenu

	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H
	jmp baddon

b1:
	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp orderb

;------------ Display order module menu
MMenu:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
moduleOption:
	mov ah, 09H
	lea dx, module
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, mstate
	int 21H

	;------ Get user module option
	mov ah, 01H
	int 21H
	sub al, 30H

	cmp al, 0
	jle errormsgm
	cmp al, 3
	jge errormsgm

	mov cx, 0
	mov cl, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;--- Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R3
	cmp al, "y"
	je R3
	cmp al, "N"
	je moduleOption
	cmp al, "n"
	je moduleOption
	jne errormsgm1
R3:
	mov mnum, cl

	mov ah, 09H
	lea dx, newLine
	int 21H

	cmp cl, 1
	je PMenu
	cmp cl, 2
	je L9

L9:
	jmp cancelM

errormsgm:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgm
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp moduleOption

errormsgm1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp moduleOption

;------------ Display payment
PMenu:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, payment
	int 21H

;------ food
NL1:
	mov bx, 0
	cmp fqty[bx], 0
	je NL2
	DisplayF1:
		mov ah, 09H
		lea dx, food1
		int 21H

		;------ Display qty food1
		call DisplayFqty

		;------ Display subtotal food1
		call DisplaySubtotalf

		mov ax, subTDF[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ1
		jl QQ2
QQ1:
		sub totalD, 100
		inc total
QQ2:
		mov ax, subTF[bx]
		add total, ax



		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

NL2:
	inc bx
	cmp fqty[bx], 0
	je NL3
	DisplayF2:
		mov ah, 09H
		lea dx, food2
		int 21H

		;------ Display qty food2
		call DisplayFqty

		;------ Display subtotal food2
		call DisplaySubtotalf

		mov ax, subTDF[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ3
		jl QQ4
QQ3:
		sub totalD, 100
		inc total
QQ4:
		mov ax, subTF[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

NL3:
	inc bx
	cmp fqty[bx], 0
	je D1
	DisplayF3:
		mov ah, 09H
		lea dx, food3
		int 21H

		;------ Display qty food3
		call DisplayFqty

		;------ Display subtotal food3
		call DisplaySubtotalf

		mov ax, subTDF[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ5
		jl QQ6
QQ5:
		sub totalD, 100
		inc total
QQ6:
		mov ax, subTF[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H


;------ beverage
D1:
	mov bx, 0
	cmp bqty[bx], 0
	je D2
	DisplayB1:
		mov ah, 09H
		lea dx, beverage1
		int 21H

		;------ Display qty beverage1
		call DisplayBqty

		;------ Display subtotal beverage1
		call DisplaySubtotalb

		mov ax, subTDB[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ7
		jl QQ8
QQ7:
		sub totalD, 100
		inc total
QQ8:
		mov ax, subTB[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

D2:
	inc bx
	cmp bqty[bx], 0
	je D3
	DisplayB2:
		mov ah, 09H
		lea dx, beverage2
		int 21H

		;------ Display qty beverage2
		call DisplayBqty

		;------ Display subtotal beverage2
		call DisplaySubtotalb

		mov ax, subTDB[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ9
		jl QQ10
QQ9:
		sub totalD, 100
		inc total
QQ10:
		mov ax, subTB[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

D3:
	inc bx
	cmp bqty[bx], 0
	je D4
	DisplayB3:
		mov ah, 09H
		lea dx, beverage3
		int 21H

		;------ Display qty beverage3
		call DisplayBqty

		;------ Display subtotal beverage3
		call DisplaySubtotalb

		mov ax, subTDB[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ11
		jl QQ12
QQ11:
		sub totalD, 100
		inc total
QQ12:
		mov ax, subTB[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

D4:
	inc bx
	cmp bqty[bx], 0
	je L16
	DisplayB4:
		mov ah, 09H
		lea dx, beverage4
		int 21H

		;------ Display qty beverage1
		call DisplayBqty

		;------ Display subtotal beverage1
		call DisplaySubtotalb

		mov ax, subTDB[bx]
		add totalD, ax
		cmp totalD, 100
		jge QQ13
		jl QQ14
QQ13:
		sub totalD, 100
		inc total
QQ14:
		mov ax, subTB[bx]
		add total, ax

		mov ah, 09H
		lea dx, space2
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

L16:
	mov ah, 09H
	lea dx, paymentL
	int 21H

;------ deli, sst, discount, rounding, total, cash, change...
	;------ Delivery Fee
	cmp onum, 2
	je delivery
	jne jump11
jump11:
	jmp jump12

delivery:
	mov ah, 09H
	lea dx, delistate
	int 21H

	mov ax, 0
	mov al, deliFee
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 02H
	mov dx, "."
	int 21H

	mov ah, 02H
	mov dl, 30H
	int 21H

	mov ah, 02H
	mov dl, 30H
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp packTax

	;------ Packaging Tax
jump12:
	cmp onum, 3
	je packTax
	cmp onum, 2
	je packTax
	jne jump13
jump13:
	jmp SSTax
	
packTax:
	mov ah, 09H
	lea dx, packageTax
	int 21H

	;--- Count package Tax for food
packf:
	mov bx, 0
	mov cx, 3
	L17:
		mov dx, 0
		cmp subTf[bx], 0
		jg L18
		LL1:
		inc bx
		loop L17
		jmp packb

	L18:
		mov ax, subTf[bx]
		mul packageFee
		div hundred
		add pack, al

		mov dl, ah
		mov ax, 0
		mov ax, subTDf[bx]
		mul packageFee
		div hundred
		add dl, al

		cmp ah, 50
		jge L19
		jl L20
		L19:
			inc dl
		L20:
			add dl, packD
			cmp dx, 100
			jge L21
			jl L22
			L21:
				sub dx, 100
				inc pack
			L22:
				mov packD, dl
				jmp LL1

	;--- Count package Tax for beverage
packb:
	mov bx, 0
	mov cx, 4
	L23:
		mov dx, 0
		cmp subTb[bx], 0
		jg L24
		LL2:
		inc bx
		loop L23
		jmp packDisplay

	L24:
		mov ax, subTb[bx]
		mul packageFee
		div hundred
		add pack, al

		mov dl, ah
		mov ax, 0
		mov ax, subTDb[bx]
		mul packageFee
		div hundred
		add dl, al

		cmp ah, 50
		jge L25
		jl L26
		L25:
			inc dl
		L26:
			add dl, packD
			cmp dx, 100
			jge L27
			jl L28
			L27:
				sub dx, 100
				inc pack
			L28:
				mov packD, dl
				jmp LL2

	;------ Display Package Tax
packDisplay:
	mov ax, 0
	mov al, pack
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 02H
	mov dx, "."
	int 21H

	mov ax, 0
	mov al, packD
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	;------ SST
SSTax:
	mov ah, 09H
	lea dx, SSTstate
	int 21H

	;--- Count SST Tax for food
SSTF:
	mov bx, 0
	mov cx, 3
	L29:
		mov dx, 0
		cmp subTf[bx], 0
		jg L30
		LL3:
		inc bx
		loop L29
		jmp SSTB

	L30:
		mov ax, subTf[bx]
		mul SSTTax
		div hundred
		add SST, al

		mov dl, ah
		mov ax, 0
		mov ax, subTDf[bx]
		mul SSTTax
		div hundred
		add dl, al

		cmp ah, 50
		jge L31
		jl L32
		L31:
			inc dl
		L32:
			add dl, SSTD
			cmp dx, 100
			jge L33
			jl L34
			L33:
				sub dx, 100
				inc SST
			L34:
				mov SSTD, dl
				jmp LL3

	;--- Count SST Tax for beverage
SSTB:
	mov bx, 0
	mov cx, 4
	L35:
		mov dx, 0
		cmp subTb[bx], 0
		jg L36
		LL4:
		inc bx
		loop L35
		jmp SSTDisplay

	L36:
		mov ax, subTb[bx]
		mul SSTTax
		div hundred
		add SST, al

		mov dl, ah
		mov ax, 0
		mov ax, subTDb[bx]
		mul SSTTax
		div hundred
		add dl, al

		cmp ah, 50
		jge L37
		jl L38
		L37:
			inc dl
		L38:
			add dl, SSTD
			cmp dx, 100
			jge L39
			jl L40
			L39:
				sub dx, 100
				inc SST
			L40:
				mov SSTD, dl
				jmp LL4

	;------ Display SST Tax
SSTDisplay:
	mov ax, 0
	mov al, SST
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 02H
	mov dx, "."
	int 21H

	mov ax, 0
	mov al, SSTD
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	;------ Member Discount
	cmp ifMem, 1
	je MemDiscount
	jne jump14
jump14:
	jmp DisplayTotal

MemDiscount:
	mov ah, 09H
	lea dx, dctstate
	int 21H

	;--- Count Member Discount for food
DiscF:
	mov bx, 0
	mov cx, 3
	L41:
		mov dx, 0
		cmp subTf[bx], 0
		jg L42
		LL5:
		inc bx
		loop L41
		jmp DiscB

	L42:
		mov ax, subTf[bx]
		mul discount
		div hundred
		add disc, al

		mov dl, ah
		mov ax, 0
		mov ax, subTDf[bx]
		mul discount
		div hundred
		add dl, al

		cmp ah, 50
		jge L43
		jl L44
		L43:
			inc dl
		L44:
			add dl, discD
			cmp dx, 100
			jge L45
			jl L46
			L45:
				sub dx, 100
				inc disc
			L46:
				mov discD, dl

				jmp LL5

	;--- Count Member Discount for beverage
DiscB:
	mov bx, 0
	mov cx, 4
	L47:
		mov dx, 0
		cmp subTb[bx], 0
		jg L48
		LL6:
		inc bx
		loop L47
		jmp DiscDisplay

	L48:
		mov ax, subTb[bx]
		mul discount
		div hundred
		add disc, al

		mov dl, ah

		mov ax, 0
		mov ax, subTDb[bx]
		mul discount
		div hundred
		add dl, al

		cmp ah, 50
		jge L49
		jl L50
		L49:
			inc dl
		L50:
			add dl, discD
			cmp dx, 100
			jge L51
			jl L52
			L51:
				sub dx, 100
				inc disc
			L52:
				mov discD, dl

				jmp LL6

	;------ Display Discount
DiscDisplay:
	;--- KaeLun discount obtained from here
	mov ax, 0
	mov al, disc
	mov disT, ax
	mov ax, 0
	mov al, discD
	mov disTD, ax
		
	mov ax, 0
	mov al, disc
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 02H
	mov dx, "."
	int 21H

	mov ax, 0
	mov al, discD
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H

	jmp DisplayTotal

	;------ Total price
DisplayTotal:	
	;------ Add SST subTotal to total
	mov ax, 0
	mov al, SSTD
	add totalD, ax
	cmp totalD, 100
	jge L59
	jl L60
	L59:
		sub totalD, 100
		add total, 1
	L60:
		mov al, SST
		add total, ax

	;------ Add Packaging Tax to total
	cmp onum, 3
	je L61
	cmp onum, 2
	je L61
	jne L62
	L61:
		mov al, packD
		add extraTD, ax
		add totalD, ax
		cmp totalD, 100
		jge L63
		jl L64
		L63:
			sub totalD, 100
			add total, 1
		L64:
			mov al, pack
			add total, ax
			add extraT, ax

		cmp extraTD, 100
		jge xtra1
		jl xtra2
	xtra1:
		sub extraTD, 100
		inc extraT
	xtra2:

	;------ Add Delivery Fee to total
	L62:
		cmp onum, 2
		je L65
		jne L66
		L65:
			mov al, deliFee
			add total, ax
			add extraT, ax

	;------ Sub Discount Fee from total
		L66:
			cmp ifMem, 1
			je L67
			jne L68
			L67:
				inc numofMemO
				mov ax, 0
				mov al, discD
				cmp totalD, ax
				jge L54
				jl L53
				L53:
					sub total, 1
					add totalD, 100
				L54:
					sub totalD, ax
					mov ax, 0
					mov al, disc
					sub total, ax
			L68:
			inc numofGuestO
	;------ Rounding Adjustmenet
	roundAdj:			
		mov ah, 09H
		lea dx, roundstate
		int 21H

		mov ax, totalD
		div ten
		cmp ah, 1
		je down1
		cmp ah, 2
		je down2
		cmp ah, 3
		je up3
		cmp ah, 4
		je up4
		cmp ah, 6
		je L129
		cmp ah, 7
		je L128
		cmp ah, 8
		je L74
		cmp ah, 9
		je L75
		jne L76	; it will be either 0 or 5, so go to remain50

		L129:
			jmp down6
		L128:
			jmp down7
		L74:
			jmp up8
		L75:
			jmp up9
		L76:
			jmp remain50
		
		down1:
			sub totalD, 1
			mov ah, 09H
			lea dx, round16
			int 21H
			jmp TotalDisplay

		down2:
			sub totalD, 2
			mov ah, 09H
			lea dx, round27
			int 21H
			jmp TotalDisplay

		up3:
			add totalD, 2
			cmp totalD, 100
			jge L126
			jl L127
			L126:
				sub totalD, 100
				inc total
			L127:
				mov ah, 09H
				lea dx, round38
				int 21H
				jmp TotalDisplay

		up4:
			add totalD, 1
			cmp totalD, 100
			jge L124
			jl L125
			L124:
				sub totalD, 100
				inc total
			L125:
				mov ah, 09H
				lea dx, round38
				int 21H
				jmp TotalDisplay

		down6:
			sub totalD, 1
			mov ah, 09H
			lea dx, round16
			int 21H
			jmp TotalDisplay

		down7:
			sub totalD, 2
			mov ah, 09H
			lea dx, round27
			int 21H
			jmp TotalDisplay

		up8:
			add totalD, 2
			cmp totalD, 100
			jge L122
			jl L123
			L122:
				sub totalD, 100
				inc total
			L123:
				mov ah, 09H
				lea dx, round38
				int 21H
				jmp TotalDisplay

		up9:
			add totalD, 1
			cmp totalD, 100
			jge L120
			jl L121
			L120:
				sub totalD, 100
				inc total
			L121:
				mov ah, 09H
				lea dx, round38
				int 21H
				jmp TotalDisplay

		remain50:
			mov ah, 09H
			lea dx, round50
			int 21H
			jmp TotalDisplay

	;------ Display Total Price
TotalDisplay:
	mov ah, 09H
	lea dx, totalstate
	int 21H

	cmp total, 100
	jge L71
	jl L72
	L71:
		mov dx, 0
		mov ax, total
		div hundred
		mov remainder, ah
		
		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp L73
	L72:
		mov ah, 02H
		mov dl, 20H
		int 21H

		mov ax, total

	L73:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov ax, totalD
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

	jmp cashDisplay

;------ Prompt and read Cash from user
	L79:
		jmp errormsgc
cashDisplay:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, cashstate
	int 21H

	;------ Get user input for cash
	mov cx, 4
	mov si, 0
	mov bx, 0
L56:
	mov ah, 01H
	int 21H
	cmp al, "."
	je L57
	sub al, 30H
	mov cashIN[si], al

	cmp al, 0
	jl L79
	cmp al, 9
	jg L79

	inc si
	loop L56

L57:
	mov cx, 2
L58:
	mov ah, 01H
	int 21H
	sub al, 30H
	mov cashIND[bx], al

	cmp al, 0
	jl L79
	cmp al, 9
	jg L79

	inc bx
	loop L58

	mov ax, 0
	mov al, cashIND[0]
	mul ten
	add al, cashIND[1]
	mov cashD, al

	;------ Confirmation
cashConfirm:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R4
	cmp al, "y"
	je R4
	cmp al, "N"
	je cashDisplay
	cmp al, "n"
	je cashDisplay
	jne errormsgc1
R4:
	mov ah, 09H
	lea dx, newLine
	int 21H

	cmp si, 1
	je L77
	cmp si, 2
	je L78
	cmp si, 3
	je L80
	L77:
		mov ax, 0
		mov al, cashIN[0]
		mov cash, ax
		jmp changeDisplay
	L78:
		mov ax, 0
		mov al, cashIN[0]
		mul ten
		mov cash, ax

		mov ax, 0
		mov al, cashIN[1]
		add cash, ax
		jmp changeDisplay
	L80:
		mov ax, 0
		mov al, cashIN[0]
		mul hundred
		mov cash, ax

		mov ax, 0
		mov al, cashIN[1]
		mul ten
		add cash, ax

		mov ax, 0
		mov al, cashIN[2]
		add cash, ax
		jmp changeDisplay

	errormsgc1:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgconf
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

		jmp cashDisplay

	errormsgc:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgc
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

		jmp cashDisplay

	;------ change
changeDisplay:
	;------ Calculate Change
L81:
	mov ax, 0
	mov al, cashD
	cmp ax, totalD
	jge L83
	jl L82
	L82:
		dec cash
		add ax, 100
	L83:
		sub ax, totalD
		mov changeD, al
		mov ax, cash
		cmp ax, total
		jge L85
		jl L84
		L84:
			mov ah, 09H
			lea dx, eromsgc1
			int 21H
			jmp cashDisplay
		L85:
			sub ax, total
			mov change, ax
			jmp DisplayChange

	;------ Display change
DisplayChange:
	mov ah, 09H
	lea dx, chgstate
	int 21H

	cmp change, 100
	jge L86
	jl L87	
	L86:
		mov dx, 0
		mov ax, change
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp L88

	L87:
		mov ax, change

	L88:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov al, changeD
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, paymentE
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H

	backtm:
		mov ah, 09H
		lea dx, btmenu
		int 21H

		mov ah, 01H
		int 21H

		jmp R11

	R11:	
		;--- Clear Screen
		mov ax, 0600H
		mov bh, 07H
		mov cx, 0000H
		mov dx, 184FH
		int 10H

		mov ah, 02H
		mov bh, 00
		mov dx, 0000H
		int 10H
	
		cmp ifMem, 0
		jne backCustM
		je backMainP
backCustM:
		jmp customerModule
backMainP:
		jmp startingP
;--------------------------------- Cancellation
cancelM:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov noOrderF, 0
	mov noOrderB, 0
	mov bx, 0
	mov cx, 3
	foodOrdersChk:
	cmp fqty[bx], 0
	JE incNoOrderFood
incNoOrderFood2:
	inc bx
	loop foodOrdersChk

	mov bx, 0
	mov cx, 4
	beveOrdersChk:
	cmp bqty[bx], 0
	JE incNoOrderBeve
incNoOrderBeve2:
	inc bx
	loop beveOrdersChk
	JMP cancOrderLeft

	incNoOrderFood:
	inc noOrderF
	JMP incNoOrderFood2

	incNoOrderBeve:
	inc noOrderB
	JMP incNoOrderBeve2

cancOrderLeft:
	mov al, noOrderF
	add noOrderB, al
	cmp noOrderB, 7
	JE errorNoOrderjmp

cancelM2:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov initialCancel, 0
	mov cancelAmount, 0
	mov inputCancel, 0
	mov cancelCateFlag, 0
	mov ah, 09h
	lea dx, cancelCate
	int 21h
	mov ah, 01h
	int 21h
	sub al, 30h
	mov cancelCateFlag, al
	cmp al, 1
	JL error4
	JE fo1
	cmp al, 2
	JE bev1jmp
	cmp al, 3
	JE termination4
	JG error4

errorNoOrderjmp: JMP errorNoOrder
termination4: JMP MMenu
error4: JMP errorCancelCate
bev1jmp: JMP chkBeve1

;------ food
fo1:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, cancelTable2
	int 21h

	mov bx, 0
	mov al, fqty[bx]
	cmp al, 0
	JE chkfood2
	mov ah, 09H
	lea dx, food1
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

chkfood2:
	mov bx, 1
	mov al, fqty[bx]
	cmp al, 0
	JE chkfood3
	mov ah, 09H
	lea dx, food2
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

chkfood3:
	mov bx, 2
	mov al, fqty[bx]
	cmp al, 0
	JE cancelFooter1jmp
	mov ah, 09H
	lea dx, food3
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	mov bx, 0

cancelFooter1jmp: JMP cancelFooter1

chkBeve1:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, cancelTable2
	int 21h
	mov bx, 0
	mov al, bqty[bx]
	cmp al, 0
	JE chkBeve2
	mov ah, 09H
	lea dx, beverage1
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

chkBeve2:
	mov bx, 1
	mov al, bqty[bx]
	cmp al, 0
	JE chkBeve3
	mov ah, 09H
	lea dx, beverage2
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

chkBeve3:
	mov bx, 2
	mov al, bqty[bx]
	cmp al, 0
	JE chkBeve4
	mov ah, 09H
	lea dx, beverage3
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

chkBeve4:
	mov bx, 3
	mov al, bqty[bx]
	cmp al, 0
	JE cancelFooter1
	mov ah, 09H
	lea dx, beverage4
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h

cancelFooter1:
	mov ah, 09H
	lea dx, cancelFoot
	int 21h

cancellation:
	sub bx, bx
	cmp cancelCateFlag, 1
	JE foodCancel
	cmp cancelCateFlag, 2
	JE beveCancel

foodCancel:
	mov ah, 09h
	lea dx, cancelMsgF
	int 21h

	mov cx, 3
	mov bx, 0
	cancelInput1:
   	mov ah, 01h
    	int 21h
	cmp al, 0
	JE CancJmp
   	mov cancelChoice1[bx], al
    	inc bx
	loop cancelInput1
	mov al, cancelChoice1[2]
	sub al, 30h
	mov initialCancel, al
	JMP validateCancelInput1

beveCancel:
	mov ah, 09h
	lea dx, cancelMsgB
	int 21h

	mov cx, 2
	mov bx, 0
	cancelInput2:
   	mov ah, 01h
    	int 21h
	cmp al, 0
	JE CancJmp
   	mov cancelChoice2[bx], al
    	inc bx
	loop cancelInput2
	mov al, cancelChoice2[1]
	sub al, 30h
	mov initialCancel, al
	JMP validateCancelInput2

CancJmp: JMP cancelM

validateCancelInput1:
		mov al, cancelChoice1[0]
		cmp al, 30h
		JE CancJmp
		JNE noError0
noError0:	
		mov al, cancelChoice1[0]
		cmp al, "N"
		JNE errorFoodCanceljmp1
		JE noError1
noError1:	
		mov al, cancelChoice1[1]
		cmp al, "L"
		JNE errorFoodCanceljmp1
		JE noError2
noError2:	
		mov al, cancelChoice1[2]
		cmp al, 31h
		JL errorFoodCanceljmp1
		JE foodQtyCheck1
		cmp al, 32h
		JE foodQtyCheck2
		cmp al, 33h
		JG errorFoodCanceljmp1
		JE foodQtyCheck3

foodQtyCheck1:
	cmp fqty[0], 0
	JE errorFoodCanceljmp1
	JNE cancelDisplay

foodQtyCheck2:
	cmp fqty[1], 0
	JE errorFoodCanceljmp1
	JNE cancelDisplay

foodQtyCheck3:
	cmp fqty[2], 0
	JE errorFoodCanceljmp1
	JNE cancelDisplay

errorFoodCanceljmp1: JMP errorFoodCancel1	

validateCancelInput2:
		mov al, cancelChoice2[0]
		cmp al, 30h
		JE CancJmp
		JNE noError3
noError3:	mov al, cancelChoice2[0]
		cmp al, "D"
		JNE errorFoodCanceljmp2
		JE noError4
noError4:	mov al, cancelChoice2[1]
		cmp al, 31h
		JL errorFoodCanceljmp2
		JE beveQtyCheck1
		cmp al, 32h
		JE beveQtyCheck2
		cmp al, 33h
		JE beveQtyCheck3
		cmp al, 34h
		JG errorFoodCanceljmp2
		JE beveQtyCheck4

beveQtyCheck1:
	cmp bqty[0], 0
	JE errorFoodCanceljmp2
	JNE cancelDisplay

beveQtyCheck2:
	cmp bqty[1], 0
	JE errorFoodCanceljmp2
	JNE cancelDisplay

beveQtyCheck3:
	cmp bqty[2], 0
	JE errorFoodCanceljmp2
	JNE cancelDisplay

beveQtyCheck4:
	cmp bqty[3], 0
	JE errorFoodCanceljmp2
	JNE cancelDisplay

errorFoodCanceljmp2: JMP errorFoodCancel2

cancelDisplay:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, cancelTable
	int 21h
	
	cmp initialCancel, 1
	JE cancelDisplay1
	cmp initialCancel, 2
	JE cancelDisplay2
	cmp initialCancel, 3
	JE cancelDisplay3
	cmp initialCancel, 4
	JE cancelDisplay4

cancelDisplay1:
	cmp cancelCateFlag, 1
	JE foodCancelDisplay1
	JNE beveCancelDisplay1

cancelDisplay2:
	cmp cancelCateFlag, 1
	JE foodCancelDisplay2
	JNE beveCancelDisplay2

cancelDisplay3:
	cmp cancelCateFlag, 1
	JE foodCancelDisplay3
	JNE beveCancelDisplay3

cancelDisplay4:
	mov ah, 09H
	lea dx, beverage4
	int 21H
	mov bx, 3
	call DisplayBqty
	jmp cancelBorder

foodCancelDisplay1:
	mov ah, 09H
	lea dx, food1
	int 21H
	mov bx, 0
	call DisplayFqty
	jmp cancelBorder

beveCancelDisplay1:
	mov ah, 09H
	lea dx, beverage1
	int 21H
	mov bx, 0
	call DisplayBqty
	jmp cancelBorder

foodCancelDisplay2:
	mov ah, 09H
	lea dx, food2
	int 21H
	mov bx, 1
	call DisplayFqty
	jmp cancelBorder

beveCancelDisplay2:
	mov ah, 09H
	lea dx, beverage2
	int 21H
	mov bx, 1
	call DisplayBqty
	jmp cancelBorder

foodCancelDisplay3:
	mov ah, 09H
	lea dx, food3
	int 21H
	mov bx, 2
	call DisplayFqty
	jmp cancelBorder

beveCancelDisplay3:
	mov ah, 09H
	lea dx, beverage3
	int 21H
	mov bx, 2
	call DisplayBqty

cancelBorder:
	mov bx, 0
	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, cancelFoot
	int 21h

cancelPrompt:
	mov al, 0
	mov cancelAmount, 0
	mov ah, 09h
	lea dx, amountPromptC
	int 21h
	mov ah, 01h
	int 21h
	sub al, 30h
	mov cancelAmount, al
	cmp cancelAmount, 1
	JL errorAmountCancjmp2
	cmp cancelAmount, 9
	JG errorAmountCancjmp2
	JE errorAmountCancjmp2
	cmp cancelCateFlag, 1
	JE amountCanCheckFoodjmp
	cmp cancelCateFlag, 2
	JE amountCanCheckBevejmp

errorAmountCancjmp2: JMP errorAmountCanc

cancelConfirmCheck:
	mov inputCancel, 'a'
	mov al, 'a'
	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, cancelConfirm
	int 21h
	mov ah, 01h
	int 21h
	mov inputCancel, al
	mov al, 0

	cmp inputCancel, 'Y'
	je cancelOrderjmp
	cmp inputCancel, 'N'
	je terminate5
	cmp inputCancel, 'y'
	je cancelOrderjmp
	cmp inputCancel, 'n'
	je terminate5
	jne errorCancelConti2jmp

amountCanCheckFoodjmp: JMP amountCanCheckFood
amountCanCheckBevejmp: JMP amountCanCheckBeve
terminate5: JMP cancelContiJmp
errorCancelConti2jmp: JMP errorCancelConti2
cancelMjmp: JMP cancelM
cancelOrderjmp:
				inc numofCancel
				JMP cancelOrder

amountCanCheckFood:
	cmp initialCancel, 1
	JE inputCancFood1
	cmp initialCancel, 2
	JE inputCancFood2
	cmp initialCancel, 3
	JE inputCancFood3

inputCancFood1:
	mov al, fqty[0]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

inputCancFood2:
	mov al, fqty[1]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

inputCancFood3:
	mov al, fqty[2]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

amountCanCheckBeve:
	cmp initialCancel, 1
	JE inputCancBeve1
	cmp initialCancel, 2
	JE inputCancBeve2
	cmp initialCancel, 3
	JE inputCancBeve3
	cmp initialCancel, 4
	JE inputCancBeve4

inputCancBeve1:
	mov al, bqty[0]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

inputCancBeve2:
	mov al, bqty[1]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

inputCancBeve3:
	mov al, bqty[2]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

inputCancBeve4:
	mov al, bqty[3]
	sub al, cancelAmount
	cmp al, 0
	JGE cancelConfirmCheckjmp
	JL errorAmountCancjmp

cancelConfirmCheckjmp: JMP cancelConfirmCheck
errorAmountCancjmp: JMP errorAmountCanc

cancelOrder:
	cmp initialCancel, 1
	JE cancelFirst
	cmp initialCancel, 2
	JE cancelSecond
	cmp initialCancel, 3
	JE cancelThird
	cmp initialCancel, 4
	JE cancelForth

cancelFirst:
	cmp cancelCateFlag, 1
	JE cancelFirstFood
	JNE cancelFirstBeve

cancelSecond:
	cmp cancelCateFlag, 1
	JE cancelSecondFood
	JNE cancelSecondBeve

cancelThird:
	cmp cancelCateFlag, 1
	JE cancelThirdFood
	JNE cancelThirdBeve

cancelForth:
	mov al, cancelAmount
	mov ah, 0
	sub bqty[3], al
	add Bsqty[3], ax
	JMP foo1

cancelFirstFood:
	mov al, cancelAmount
	mov ah, 0
	sub fqty[0], al
	add Fsqty[0], ax
	JMP foo1

cancelFirstBeve:
	mov al, cancelAmount
	mov ah, 0
	sub bqty[0], al
	add Bsqty[0], ax
	JMP foo1

cancelSecondFood:
	mov al, cancelAmount
	mov ah, 0
	sub fqty[1], al
	add Fsqty[1], ax
	JMP foo1

cancelSecondBeve:
	mov al, cancelAmount
	mov ah, 0
	sub bqty[1], al
	add Bsqty[1], ax
	JMP foo1

cancelThirdFood:
	mov al, cancelAmount
	mov ah, 0
	sub fqty[2], al
	add Fsqty[2], ax
	JMP foo1

cancelThirdBeve:
	mov al, cancelAmount
	mov ah, 0
	sub bqty[2], al
	add Bsqty[2], ax
	JMP foo1

foo1:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	mov ah, 09h
	lea dx, cancelTable2
	int 21h

	mov bx, 0
	mov al, fqty[bx]
	cmp al, 0
	JE checkfood2
	mov ah, 09H
	lea dx, food1
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

checkfood2:
	mov bx, 1
	mov al, fqty[bx]
	cmp al, 0
	JE checkfood3
	mov ah, 09H
	lea dx, food2
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

checkfood3:
	mov bx, 2
	mov al, fqty[bx]
	cmp al, 0
	JE checkBeve1
	mov ah, 09H
	lea dx, food3
	int 21H
	call DisplayFqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	mov bx, 0

checkBeve1:
	mov bx, 0
	mov al, bqty[bx]
	cmp al, 0
	JE checkBeve2
	mov ah, 09H
	lea dx, beverage1
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

checkBeve2:
	mov bx, 1
	mov al, bqty[bx]
	cmp al, 0
	JE checkBeve3
	mov ah, 09H
	lea dx, beverage2
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

checkBeve3:
	mov bx, 2
	mov al, bqty[bx]
	cmp al, 0
	JE checkBeve4
	mov ah, 09H
	lea dx, beverage3
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h
	inc bx

checkBeve4:
	mov bx, 3
	mov al, bqty[bx]
	cmp al, 0
	JE cancelFooter2
	mov ah, 09H
	lea dx, beverage4
	int 21H
	call DisplayBqty
	mov ah, 09h
	lea dx, newLine
	int 21h

cancelFooter2:
	mov ah, 09H
	lea dx, cancelFoot
	int 21h

cancelContiJmp:
	mov inputCancel, 'a'
	mov al, 'a'
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, cancelConti
	int 21h
	mov ah, 01h
	int 21h
	mov inputCancel, al
	mov al, 0

	cmp inputCancel, 'Y'
	je cancelMjmp3
	cmp inputCancel, 'N'
	je mainMenuCanc
	cmp inputCancel, 'y'
	je cancelMjmp3
	cmp inputCancel, 'n'
	je mainMenuCanc
	jne errorCancelContijmp

errorCancelContijmp: JMP errorCancelConti
cancelMjmp3: JMP cancelM
mainMenuCanc: JMP MMenu

errorFoodCancel:
	mov ah, 09h
	lea dx, errorCanc
	int 21h
	mov ah, 02H
	mov dx, newline
	int 21H
	jmp cancelM

errorFoodCancel1:
	mov ah, 09h
	lea dx, errorCanc
	int 21h
	mov ah, 02H
	mov dx, newline
	int 21H
	mov ah, 01h
	int 21h
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	jmp fo1

errorFoodCancel2:
	mov ah, 09h
	lea dx, errorCanc
	int 21h
	mov ah, 02H
	mov dx, newline
	int 21H
	mov ah, 01h
	int 21h
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	jmp chkBeve1
	

errorCancelCate:
	mov ah, 02H
	mov dx, newline
	int 21H
	mov ah, 09h
	lea dx, errorCanc
	int 21h
	mov ah, 01h
	int 21h
	jmp cancelM

errorAmountCanc:
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, errorCanc
	int 21h
	mov ah, 01h
	int 21h
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
	jmp cancelDisplay

errorCancelConti:
	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, errorCanc
	int 21h
	mov ah, 01h
	int 21h
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H
	JMP foo1

errorCancelConti2:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, errorCanc
	int 21h
	JMP cancelConfirmCheck

errorNoOrder:
	mov ah, 09h
	lea dx, cancelCate
	int 21h
	lea dx, cancPrompt1
	int 21h

	mov ah, 09h
	lea dx, newLine
	int 21h
	lea dx, cancelNoOrder
	int 21h
	lea dx, newLine
	int 21h
	mov ah, 01H
	int 21H
	cmp ifMem, 0
	JE startingPjmp
	JMP customerModule

startingPjmp: JMP startingP
;---------------------------------------------------Staff Module
staffM:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, validatestaff
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, logo
	int 21H

	mov ah, 09H
	lea dx, staffMenu
	int 21H

	mov ah, 09H
	lea dx, staffPrompt
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H
	mov input, al

	;--- Confirmation
	mov ah, 09H
	lea dx, newline
	int 21H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je SC01
	cmp al, "y"
	je SC01
	cmp al, "N"
	je staffM
	cmp al, "n"
	je staffM
	jne serror

serror:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp staffM

SC01:
	cmp input, 1
	jl staffError
	je reportFunction
	cmp input, 2
	je restockFunction
	cmp input, 3
	je PAFunction
	cmp input, 4
	jg staffError
	je BF2

staffError:
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, chk1n4
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp staffModule

reportFunction:
	jmp reportF
restockFunction:
	jmp SMenu
PAFunction:
	jmp Cmenu
BF2:
	jmp startingP

;--------------------------------- Restock Module
;------ Stock
SMenu:
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, stock
	int 21H

stockCategory:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, sstate
	int 21H

	;------ Get staff stock category
	mov ah, 01H
	int 21H
	sub al, 30H
	mov snum, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;--- Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je R5
	cmp al, "y"
	je R5
	cmp al, "N"
	je stockCategory
	cmp al, "n"
	je stockCategory
	jne errormsgs1
R5:
	mov ah, 09H
	lea dx, newLine
	int 21H

	;------ Validate
	cmp snum, 0
	jle errormsgs
	cmp snum, 4
	jge errormsgs

	cmp snum, 1
	je FSMenu	; food stock menu
	cmp snum, 2
	je L89
	cmp snum, 3
	je L90
L89:
	jmp BSMenu	; beverage stock menu
L90:
	jmp staffM	; back to main menu
errormsgs:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgs
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	jmp Smenu ; loop to prompt and read again

errormsgs1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	jmp Smenu ; loop to prompt and read again

;------------ Display Food & Beverage remained stock
	;------ Food Menu
FSMenu:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, menuH
	int 21H

	mov ah, 09H
	lea dx, fstock
	int 21H

	;------ food1
	mov ah, 09H
	lea dx, food1
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display food1 stock qty
	lea si, fsqty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ food2
	mov ah, 09H
	lea dx, food2
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display food2 stock qty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ food3
	mov ah, 09H
	lea dx, food3
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display food3 stock qty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	mov ah, 09H
	lea dx, menuL
	int 21H

	jmp RMenu

BSMenu:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, menuH
	int 21H

	mov ah, 09H
	lea dx, bstock
	int 21H

	;------ Beverage1
	mov ah, 09H
	lea dx, Beverage1
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display beverage1 stock qty
	lea si, bsqty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Beverage2
	mov ah, 09H
	lea dx, Beverage2
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display Beverage2 stock qty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Beverage3
	mov ah, 09H
	lea dx, Beverage3
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display Beverage3 stock qty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	;------ Beverage4
	mov ah, 09H
	lea dx, Beverage4
	int 21H

	mov ah, 02H
	mov dl, 20H
	int 21H

	;------ Display Beverage4 stock qty
	call Displayfbsqty

	mov ah, 02H
	mov dl, 20H
	int 21H

	mov ah, 09H
	lea dx, menuE
	int 21H

	mov ah, 09H
	lea dx, menuL
	int 21H

;------ Restock
RMenu:
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0900H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0800H
	int 10H
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, restock
	int 21H

restockCategory:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, rstate
	int 21H

	;------ Get restock category
	mov ah, 01H
	int 21H
	sub al, 30H
	mov rnum, al

	mov ah, 09H
	lea dx, newLine
	int 21H

	;--- Confirmation
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je R6
	cmp al, "y"
	je R6
	cmp al, "N"
	je rmenu
	cmp al, "n"
	je rmenu
	jne errormsgr1
R6:
	;------ Validate
	cmp rnum, 0
	jle errormsgr
	cmp rnum, 4
	jge errormsgr

	mov ah, 09H
	lea dx, newLine
	int 21H

	cmp rnum, 1
	je L130		; add to all stock
	cmp rnum, 2
	je L94
	cmp rnum, 3
	je L95
L130:
	jmp ATAS
L94:
	jmp ATOS	; add to one stock
L95:
	jmp SMenu	; return

errormsgr:
	mov ah, 09H
	lea dx, newLine
	int 21H
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgs
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp rmenu

errormsgr1:
	mov ah, 09H
	lea dx, newLine
	int 21H
	mov ah, 09H
	lea dx, newLine
	int 21H
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	jmp rmenu

	;------ Restock Process ABAS = Add By All Stock
	L107:
		jmp errormsgrs
	L138:
		mov ah, 09H
		lea dx, newline
		int 21H

		mov ah, 09H
		lea dx, errmsgrange
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H

		mov ah, 09H
		lea dx, bsmsg
		int 21H

		mov ah, 01H
		int 21H
		jmp ATAS

ATAS:
	mov ah, 09H
	lea dx, promptsq
	int 21H

	mov cx, 4
	mov si, 0
	mov ax, 0
	call getSqty

addStock:
	cmp snum, 1
	je L96
	jne L97
L96:
	mov bx, 0
	mov cx, 3
	L109:
		mov ax, sqty
		add fsqty[bx], ax
		add refqty[bx], ax
		cmp fsqty[bx], 999
		jg L138
		add bx, 2
		loop L109
	inc numofrestock
	jmp FSMenu
L139:
	jmp L138
L97:
	mov bx, 0
	mov cx, 4
	L110:
		mov ax, sqty
		add bsqty[bx], ax
		add refqty[bx], ax
		cmp bsqty[bx], 999
		jg L139
		add bx, 2
		loop L110
	inc numofrestock
	jmp BSMenu

ATOS:
	cmp snum, 1
	je addfood
	jne R12
	R12:
		jmp addbev

addfood:
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0F00H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0F00H
	int 10H
	mov ah, 09H
	lea dx, getfnum
	int 21H

	mov ax, 0
	mov si, 0
	;------ Get food number
	mov ah, 01H
	int 21H
	sub al, 30H
	mov gnum, al
	
	;--- Confirmation
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je R7
	cmp al, "y"
	je R7
	cmp al, "N"
	je addfood
	cmp al, "n"
	je addfood
	jne errormsgfs1

R7:
	;------ Validate
	cmp gnum, 0
	jle errormsgfs
	cmp gnum, 4
	jge errormsgfs
	jmp L111

errormsgfs:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgf
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp addfood

errormsgfs1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp addfood

addbev:
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0F00H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0F00H
	int 10H
	mov ah, 09H
	lea dx, getbnum
	int 21H

	mov ax, 0
	mov si, 0
	;------ Get beverage number
	mov ah, 01H
	int 21H
	sub al, 30H

	;------ Validate
	cmp al, 0
	jle errormsgbs
	cmp al, 5
	jge errormsgbs

	mov cx, 0
	mov cl, al

	;--- Confirmation
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	;------ Validate
	cmp al, "Y"
	je R8
	cmp al, "y"
	je R8
	cmp al, "N"
	je addbev
	cmp al, "n"
	je addbev
	jne errormsgbs1
R8:
	mov gnum, cl
	jmp L111

errormsgbs:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgb
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp addbev

errormsgbs1:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, eromsgconf
	int 21H

	mov ah, 09H
	lea dx, newLine
	int 21H
	jmp addbev

L111:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, promptsq
	int 21H

	mov cx, 4
	mov si, 0
	mov ax, 0

	call getsqty
	inc numofrestock

	cmp snum, 1
	je L112
	jne L113
L112:
	mov cx, 0
	mov bl, gNum
	dec bx
	cmp bx, 0
	je incFS1
	cmp bx, 1
	je incFS2
	cmp bx, 2
	je incFS3
L142:
	jmp L141
incFS1:
	mov ax, sqty
	add fsqty[0], ax
	add refqty[0], ax
	cmp fsqty[0], 999
	jg L142
	jmp FSMenu
incFS2:
	mov ax, sqty
	add fsqty[2], ax
	add refqty[2], ax
	cmp fsqty[2], 999
	jg L142
	jmp FSMenu
incFS3:
	mov ax, sqty
	add fsqty[4], ax
	add refqty[4], ax
	cmp fsqty[4], 999
	jg L141
	jmp FSMenu
L113:
	mov cx, 0
	mov bl, gNum
	dec bx
	cmp bx, 0
	je incBS1
	cmp bx, 1
	je incBS2
	cmp bx, 2
	je incBS3
	cmp bx, 3
	je incBS4

incBS1:
	mov ax, sqty
	add bsqty[0], ax
	add rebqty[0], ax
	cmp bsqty[0], 999
	jg L141
	jmp BSMenu
incBS2:
	mov ax, sqty
	add bsqty[2], ax
	add rebqty[2], ax
	cmp bsqty[2], 999
	jg L141
	jmp BSMenu
incBS3:
	mov ax, sqty
	add bsqty[4], ax
	add rebqty[4], ax
	cmp bsqty[4], 999
	jg L141
	jmp BSMenu
incBS4:
	mov ax, sqty
	add bsqty[6], ax
	add rebqty[6], ax
	cmp bsqty[6], 999
	jg L141
	jmp BSMenu

L141:
	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, errmsgrange
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, bsmsg
	int 21H

	mov ah, 01H
	int 21H
	jmp ATOS

;--------------------------------- PRICE ADJUSTMENT
cMenu:	
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	lea dx, logo
	int 21H
	
	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display category menu
	mov ah, 09H
	lea dx, frameH
	int 21H
	
	lea dx, category
	int 21H
	
	lea dx, frameL
	int 21H

	;--- prompt and read category
	mov ah, 09H
	mov dx, offset prompt1
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H		; change to hexa
	mov input, al	; store the input value

	mov ah, 02H
	mov dx, newline
	int 21H	
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p1
	cmp proceed, "y"
	je p1
	cmp proceed, "N"
	je Cmenujmp
	cmp proceed, "n"
	je Cmenujmp
	jne proceedError1

Cmenujmp: JMP Cmenu
	
proceedError1:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	jmp cMenu

	

p1:	;--- compare the input	

	sub bx, bx		; clear bx register for identifying the location to jump back from errorMsg
	cmp input, 1
	jl	errorMsgCmenu
	je	j1
	jne	j2
j1:	mov bx, 11
	jmp	fMenu		; jump to foodmenu 
j2:	cmp input, 2
	jne	j4
	je	j3
j3:	mov bx, 12
	jmp	bMenu		; jump to beveragemenu 
j4:	cmp input, 3
	jg	errorMsgCmenu
	jmp	staffModule

errorMsgCmenu:

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n3
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp	cMenu

aMenu:		
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0800H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0800H
	int 10H

	;--- display adjustment menu
	mov ah, 09H
	lea dx, frameH
	int 21H
	
	mov ah, 09H
	mov dx, offset adjustment
	int 21H

	lea dx, frameL
	int 21H

	;--- prompt and read method of adjustment
	mov ah, 09H
	lea dx, prompt2
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H
	mov input, al

	mov ah, 02H
	mov dx, newline
	int 21H	
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p2
	cmp proceed, "y"
	je p2
	cmp proceed, "N"
	je aMenu
	cmp proceed, "n"
	je aMenu
	jne proceedError2

p2:	cmp bx, 11
	je	FA		; jump to foodAdjustment(FA) is bx is 1
	cmp bx, 12		
	je	BJMP		; jump to beverageAdjustment(BA) if bx is 2
BJMP:	jmp	BA

proceedError2:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	cmp bx, 11
	je Fmenu01
	jmp Bmenu
Fmenu01: 
	jmp fmenu


;------------------------- Food Adjustment Part
FA:	
	;--- foodAdjustment
	; if(input == 2)
	cmp input, 1
	jl errorMsgFA
	je ct6
	jg ct7
ct6:	jmp FINCP
ct7:	cmp input, 2
	je FINCV		; jump to food increase by value(FINCV)
	cmp input, 3
	je ct3
	jne ct8
ct3:	jmp FDECP
	; else if (input == 4)
ct8:	cmp input, 4
	je ct4		; jump to food decrease by value(FDECV)
	jne ct5
ct4:	jmp FDECV
ct5:	cmp input, 5
	je cM1
	jg errorMsgFA
	
cM1:	jmp cMenu

errorMsgFA:
	mov ah, 02H
	mov dx, newline
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n5
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov bx, 11
	jmp Fmenu
;--- Increase all by value	
FINCV:	
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	;--- prompt and read input
	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display prompt3	
	mov ah, 09H
	lea dx, prompt3
	int 21H
	
	CALL ValInput

	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p3
	cmp proceed, "y"
	je p3
	cmp proceed, "N"
	je FINCV
	cmp proceed, "n"
	je FINCV
	jne proceedError3

proceedError3:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp FINCV

p3:	
	mov bx, 0
	mov cx, 4


validateVal:
	cmp value[bx], 0
	jl errorInput
	cmp value[bx], 9
	jg errorInput
	inc bx
	loop validateVal

	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 3
	mov bx, 0
	jmp INCALL


errorInput:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 0
	mov ah, 09H	
	lea dx, chkval
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov cx, 3
	mov bx, 0
	jmp FINCV
	
;--- Decrease a particular by value
FDECV:
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1100H
	int 10H
	;--- prompt and read input
	mov ah, 02H
	mov dx, newline
	int 21H

	;--- prompt and read for a particular product
	mov ah, 09H
	lea dx, prompt4
	int 21H

	mov ax, 0
	mov ah, 01H
	int 21H
	sub al, 30H
	cmp al, 1
	jl	c8
	jge	c9
c8:	jmp errorFDECV
c9:	cmp al, 3
	jg	c10
	jle	c11
c10:	jmp errorFDECV
	
c11:	mov ah, 0
	mov si, 0
	mov si, ax
	dec si

	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display prompt6
	mov ah, 09H
	lea dx, prompt6
	int 21H

	CALL ValInput

	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p4
	cmp proceed, "y"
	je p4
	cmp proceed, "N"
	je BFDE
	cmp proceed, "n"
	je BFDE
	jne proceedError4
BFDE:
	jmp FDECV

proceedError4:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp FDECV

p4:	mov cx, 4
	mov bx, 0
validateVal2:
	cmp value[bx], 0
	jl errorInput2
	cmp value[bx], 9
	jg errorInput2
	inc bx
	loop validateVal2

	mov ah, 02H
	mov dx, newline
	int 21H
	jmp DECone

errorFDECV:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n3
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H

	jmp FDECV

errorInput2:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 0
	mov ah, 09H	
	lea dx, chkval
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov cx, 3
	mov bx, 0
	jmp FDECV

INCALL:
	;--- Loop 3 times for all product price to be increased
	;--- conversion of fractionPart of inputValue 
	mov ax, 0
	mov al, value[2]
	mul ten
	add al, value[3]
	add al, fpriceD[bx]
	CMP ax, 100
	jge JCarry	; if ax >= 100, JumpCarry(JC) to call carry function
	jl  C1		; if ax < 100, jump to continue1(C1)
JCarry:	
	CALL Carry
	jmp INCAL1

C1:	mov fpriceD[bx], al

INCAL1:
	;--- if decimal < 100
	mov dx, 0
	mov ax, 0
	mov al, value[0]
	mul ten
	add al, value[1]
	mov dl, al
	add fprice[bx], al
	add dl, fprice[bx]
	cmp dx, 100
	jge setMax1
	jl NSMAX1
	setMax1:
	mov fprice[bx], 99
	mov fpriceD[bx], 99
	NSMax1:
	inc bx
	loop INCALL

	mov bx, 11
	INC numofPA
	jmp FMenu
	
DECone:
	;--- conversion of fractionPart of inputValue
	mov ax, 0
	mov dx, 0
	mov cx, 0
	mov al, value[2]
	mul ten
	add al, value[3]
	mov dl, al
	mov ax, 0
	mov al, value[0]
	mul ten
	add al, value[1]
	cmp al, fprice[si]
	jg	Exceed
	je	CheckD
	jl	DECone2
CheckD:
	cmp dl, fpriceD[si]
	jg	Exceed
	jle	DECone2
DECone2:
	cmp dl, fpriceD[si]		
	; if(dl > fpriceD[si])
	mov cl, fpriceD[si]
	jg 	Borrow

C2:	
	sub cx, dx
	mov fpriceD[si], cl
	sub fprice[si], al	
	mov bx, 11
	INC numofPA
	jmp Fmenu

Exceed:
	mov ah, 09H
	lea dx, error1
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov bx, 11
	jmp fMenu
	
Borrow:
	dec fprice[si]
	add cl, 100
	jmp C2		; jump back to continue2(C2)

;--- Increase all by percentage
FINCP:	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov si, 0
	mov di, 0
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	mov ah, 09H
	lea dx, prompt8
	int 21H

	CALL inputPercent
	
	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p7
	cmp proceed, "y"
	je p7
	cmp proceed, "N"
	je FINCP
	cmp proceed, "n"
	je FINCP
	jne proceedError7

proceedError7:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp FINCP

p7:
	;--- multiply with percentage(mulP)
	mov cx, 3
	mov si, 0
mulP:
	;--- whole part calculation
	mov ax, 0
	mov dx, 0
	mov bx, 0
	mov al, fprice[si]	
	mov bl, fprice[si]
	mul accP			; become a large value and carry to ah(ax stores the value)

Cont2:
	div hundred2
	add Fprice[si], al
	add bx, ax
	cmp bx, 100
	jge setMax2
	jl NSMAX2
	setMax2:
	mov fprice[si], 99
	mov fpriceD[si], 99
	jmp maxCont
	NSMax2:
	mov al, FpriceD[si]
	add dl, FpriceD[si]

	cmp dx, 100
	jge PCR4
	jl Cont3
PCR4:	
	sub dx, 100
	inc bl
	cmp bx, 100
	jge setMax2
	inc fprice[si]

Cont3:	
	mov FpriceD[si], dl
	mov ah, 0
	mul accP
	div hundred2
	add al, FpriceD[si]

CCMP:
	cmp ax, 100
	jge PCR1
	jl Cont1

PCR1:
	sub ax, 100
	inc Fprice[si]
	inc bl
	cmp bx, 100
	jge setMax2
	jmp ccmp


Cont1: 
	mov FpriceD[si], al
	maxCont:
	inc si
	Loop mulP

	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov bx, 11
	INC numofPA
	jmp Fmenu

;--- decrease all by percentage
FDECP:	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov si, 0
	mov di, 0
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	mov ah, 09H
	lea dx, prompt9
	int 21H

	CALL inputPercent

	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p9
	cmp proceed, "y"
	je p9
	cmp proceed, "N"
	je FDECP
	cmp proceed, "n"
	je FDECP
	jne proceedError9

proceedError9:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp FDECP

p9:

	mov cx, 3
	mov di, 0
	cmp accP, 100
	jge Fzero

calFP:
	mov ax, 0
	mov dx, 0
	mov bx, 0
	cmp fprice[di], 0
	je cmpFDZ
	jne contFDNZ
	cmpFDZ:
	cmp fpriceD[di], 0
	je contFDZ
contFDNZ:
	mov al, fprice[di]
	mul accP
	div hundred
	sub fprice[di], al
	mov bl, ah

	mov ax, 0
	mov al, fpriceD[di]
	mul accP
	div hundred
	mov ah, 0
	add bl, al

	mov al, fpriceD[di]

	cmp ax, bx
	jl borrowFP
	jge cont5

borrowFP:
	dec fprice[di]
	add ax, 100
cont5:	
	sub ax, bx
	mov fpriceD[di], al
contFDZ:
	inc di
	Loop calFP

	mov ah, 02H
	mov dx, newline
	int 21H
	mov bx, 11
	INC numofPA
	jmp fMenu

Fzero:
	mov fprice[di], 0
	mov fpriceD[di], 0
	inc di
	Loop Fzero
	
	mov ah, 02H
	mov dx, newline
	int 21H
	INC numofPA
	mov bx, 11
	jmp fMenu

;---------------------- Beverage Adjustment Part
BA:	
	;--- BEVERAGE Adjustment
	; if(input == 2)
	cmp input, 1
	jl errorMsgBA
	je c130
	jg c140
c130:	jmp BINCP
c140:	cmp input, 2
	je BINCV		; jump to food increase by value(FINCV)
	cmp input, 3
	je c220
	jne c230
c220:	jmp BDECP
	; else if (input == 4)
c230:	cmp input, 4
	je c150		; jump to food decrease by value(FDECV)
	jne c160
c150:	jmp BDECV
c160:	cmp input, 5
	je cM20
	jg errorMsgBA
	
cM20:	jmp cMenu

errorMsgBA:
	mov ah, 02H
	mov dx, newline
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n5
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov bx, 12
	jmp Bmenu

;--- Increase all by value	
BINCV:	
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	;--- prompt and read input
	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display prompt3	
	mov ah, 09H
	lea dx, prompt3
	int 21H
	
	CALL ValInput

	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p50
	cmp proceed, "y"
	je p50
	cmp proceed, "N"
	je BINCV
	cmp proceed, "n"
	je BINCV
	jne proceedError5

proceedError5:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp BINCV

p50:	mov bx, 0
	mov cx, 4


validateVal3:
	cmp value[bx], 0
	jl errorInput3
	cmp value[bx], 9
	jg errorInput3
	inc bx
	Loop validateVal3

	mov cx, 4
	mov bx, 0
	jmp BINCALL


errorInput3:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 0
	mov ah, 09H	
	lea dx, chkval
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov cx, 4
	mov bx, 0
	jmp BINCV
	
;--- Decrease a particular by value
BDECV:
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H

	;--- prompt and read for a particular product
	mov ah, 09H
	lea dx, prompt5
	int 21H

	mov ax, 0
	mov ah, 01H
	int 21H
	sub al, 30H
	cmp al, 1
	jl	c190
	jge	c210
c190:	jmp errorBDECV
c210:	cmp al, 4
	jg	c170
	jle	c180
c170:	jmp errorBDECV
	
c180:	mov ah, 0
	mov si, 0
	mov si, ax
	dec si

	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display prompt6
	mov ah, 09H
	lea dx, prompt6
	int 21H

	CALL ValInput

	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p60
	cmp proceed, "y"
	je p60
	cmp proceed, "N"
	je BDEC
	cmp proceed, "n"
	je BDEC
	jne proceedError6
BDEC:
	jmp BDECV

proceedError6:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp BDECV

p60:	mov cx, 4
	mov bx, 0
validateVal4:
	cmp value[bx], 0
	jl errorInput4
	cmp value[bx], 9
	jg errorInput4
	inc bx
	loop validateVal4

	mov ah, 02H
	mov dx, newline
	int 21H
	jmp DECone3

errorBDECV:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n4
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp BDECV

errorInput4:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 0
	mov ah, 09H	
	lea dx, chkval
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov cx, 4
	mov bx, 0
	jmp BDECV

BINCALL:
	;--- Loop 4 times for all product price to be increased
	;--- conversion of fractionPart of inputValue 
	mov ax, 0
	mov al, value[2]
	mul ten
	add al, value[3]
	add al, BpriceD[bx]
	CMP ax, 100
	jge JCarry2	; if ax >= 100, JumpCarry(JC) to call carry function
	jl  C100		; if ax < 100, jump to continue1(C1)
JCarry2:
	CALL BCarry
	jmp BINCAL1

C100:	mov BpriceD[bx], al

BINCAL1:
	;--- if decimal < 100
	mov ax, 0
	mov dx, 0
	mov al, value[0]
	mul ten
	add al, value[1]
	mov dl, al
	add Bprice[bx], al
	add dl, bprice[bx]
	cmp dx, 100
	jge setMax3
	jl NSMAX3
	setMax3:
	mov Bprice[bx], 99
	mov BpriceD[bx], 99
	NSMax3:
	inc bx
	loop BINCALL
	mov bx, 12
	INC numofPA
	jmp BMenu
	
DECone3:
	;--- conversion of fractionPart of inputValue
	mov ax, 0
	mov dx, 0
	mov cx, 0
	mov al, value[2]
	mul ten
	add al, value[3]
	mov dl, al
	mov ax, 0
	mov al, value[0]
	mul ten
	add al, value[1]
	cmp al, Bprice[si]
	jg	BEX1
	je	CheckD1
	jl	DECone4
BEX1:	jmp Exceed1
CheckD1:
	cmp dl, BpriceD[si]
	jg	BEX1
	jle	DECone4
DECone4:
	cmp dl, BpriceD[si]		
	; if(dl > BpriceD[si])
	mov cl, BpriceD[si]
	jg 	BBRW1
	jle	C200
BBRW1:	jmp Borrow1

C200:	
	sub cx, dx
	mov BpriceD[si], cl
	sub Bprice[si], al	
	mov bx, 12
	INC numofPA
	jmp Bmenu

;--- Increase all by percentage
BINCP:	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov si, 0
	mov di, 0
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	mov ah, 09H
	lea dx, prompt8
	int 21H
	CALL inputPercent
	
	
	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p8
	cmp proceed, "y"
	je p8
	cmp proceed, "N"
	je BINCP
	cmp proceed, "n"
	je BINCP
	jne proceedError8

proceedError8:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp BINCP

p8:
	;--- multiply with percentage(mulP)
	mov cx, 4
	mov si, 0
BmulP:
	;--- whole part calculation
	mov ax, 0
	mov dx, 0
	mov bx, 0
	mov al, Bprice[si]	
	mov bl, Bprice[si]
	mul accP			; become a large value and carry to ah(ax stores the value)
	
BCont2:
	div hundred2
	add Bprice[si], al
	add bx, ax
	cmp bx, 100
	jge setMax4
	jl NSMAX4
	setMax4:
	mov Bprice[si], 99
	mov BpriceD[si], 99
	jmp maxCont2
	NSMax4:
	mov al, BpriceD[si]
	add dl, BpriceD[si]

	cmp dx, 100
	jge BPCR4
	jl BCont3
BPCR4:	
	inc bl
	cmp bx, 100
	jge setMax4
	CALL BPCarry2

BCont3:	
	mov BpriceD[si], dl
	mov ah, 0
	mul accP
	div hundred2
	add al, BpriceD[si]
	jmp BCCMP

BCCMP:
	cmp ax, 100
	jge BPCR1
	jl BCont1

BPCR1:
	inc bl
	cmp bx, 100
	jge setMax4
	CALL BPCarry1
	jmp bccmp


BCont1: 
	mov BpriceD[si], al
	maxCont2:
	inc si
	Loop BmulP

	mov ah, 02H
	mov dx, newline
	int 21H

	mov bx, 12
	INC numofPA
	jmp Bmenu

Exceed1:
	mov ah, 09H
	lea dx, error1
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	mov bx, 12
	jmp bMenu
	
Borrow1:
	dec Bprice[si]
	add cl, 100
	jmp C200		; jump back to continue2(C2)

;--- decrease all by percentage
BDECP:	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov dx, 0
	mov si, 0
	mov di, 0
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1200H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1200H
	int 10H
	mov ah, 09H
	lea dx, prompt9
	int 21H
	CALL inputPercent
	
	mov ah, 02H
	mov dx, newline
	int 21H
	
	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je p10
	cmp proceed, "y"
	je p10
	cmp proceed, "N"
	je BDECP
	cmp proceed, "n"
	je BDECP
	jne proceedError10

proceedError10:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	jmp BDECP

p10:

	mov cx, 4
	mov di, 0
	cmp accP, 100
	jge Bzero

calBP:
	mov ax, 0
	mov dx, 0
	mov bx, 0
	cmp Bprice[si], 0
	je cmpBDZ
	jne contBDNZ
cmpBDZ:
	cmp BpriceD[si], 0
	je contBDZ
contBDNZ:
	mov al, Bprice[di]
	mul accP
	div hundred
	sub Bprice[di], al
	mov bl, ah

	mov ax, 0
	mov al, BpriceD[di]
	mul accP
	div hundred
	mov ah, 0
	add bl, al

	mov al, BpriceD[di]

	cmp ax, bx
	jl borrowBP
	jge cont6

borrowBP:
	dec Bprice[di]
	add ax, 100


cont6:	
	sub ax, bx
	mov BpriceD[di], al
contBDZ:
	inc di
	Loop calBP

	mov ah, 02H
	mov dx, newline
	int 21H
	mov bx, 12
	INC numofPA
	jmp Bmenu

Bzero:
	mov Bprice[di], 0
	mov BpriceD[di], 0
	inc di
	Loop Bzero

	mov ah, 02H
	mov dx, newline
	int 21H
	mov bx, 12
	INC numofPA
	jmp BMenu

;------------ REPORTING MODULE
reportF:

;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	;--- Print reporting menu
	mov ah, 02H
	mov dx, newline
	int 21H

	;--- display types menu
	mov ah, 09H
	lea dx, frameH
	int 21H
	
	lea dx, report
	int 21H
	
	lea dx, frameL
	int 21H

	mov ah, 09H
	lea dx, prompt10
	int 21H

	mov ah, 01H
	int 21H
	sub al, 30H
	mov input, al

	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	mov dx, offset prompt7
	int 21H

	mov ah, 01H
	int 21h
	mov proceed, al
	
	cmp proceed, "Y"
	je RP1
	cmp proceed, "y"
	je RP1
	cmp proceed, "N"
	je reportF
	cmp proceed, "n"
	je reportF
	jne proceedError11

proceedError11:
	mov ah, 02H
	mov dx, newLine
	int 21H

	mov ah, 09H
	lea dx, chkval
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H

	jmp reportF

RP1:
	cmp input, 1
	jl Rerror1
	je earning
	cmp input, 2
	je exps
	jne nexps
exps:	jmp expenses
nexps:	cmp input, 3
	je BS01
	jg Rerror1

BS01:
	jmp staffModule


Rerror1:
	mov ah, 02H
	mov dx, newLine
	int 21H
	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, chk1n3
	int 21H
	
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H
	jmp reportF

earning:
;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	;--- Display Title and Date
	mov ah, 09H
	lea dx, R1title
	int 21H
	
	;--- get Today's DATE
	mov ah, 2ah
	int 21H

	mov day, dl
	mov month, dh
	mov year, cx

	mov ax, 0
	mov dx, 0
	mov cx, 0
	mov bx, 0
	mov subDNL[0], 0
	mov subNL[0], 0
	mov subDNL[1], 0
	mov subNL[1], 0
	mov subDNL[2], 0
	mov subNL[2], 0
	mov subDD[0], 0
	mov subD[0], 0
	mov subDD[1], 0
	mov subD[1], 0
	mov subDD[2], 0
	mov subD[2], 0
	mov subDD[3], 0
	mov subD[3], 0
	mov roundingVal, 0
	mov Ttl, 0
	mov ttlD, 0
	CALL displayDate

	mov ah, 09H
	lea dx, earnH
	int 21H

	mov ah, 09h
	lea dx, flabel
	int 21H
	mov bx, 0

	mov ah, 09H
	lea dx, fd1
	int 21H
	CALL displayQtyNL
	CALL calcSubNL
	CALL DisplaySubNL
	mov ax, subDNL[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ1
	jl TQ2
TQ1:
		sub TTLD, 100
		inc TTL
TQ2:
		mov ax, subNL[bx]
		add TTL, ax
	inc bx

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, fd2
	int 21H
	CALL displayQtyNL
	CALL calcSubNL
	CALL DisplaySubNL
	mov ax, subDNL[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ3
	jl TQ4
TQ3:
		sub TTLD, 100
		inc TTL
TQ4:
		mov ax, subNL[bx]
		add TTL, ax
	inc bx

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, fd3
	int 21H
	CALL displayQtyNL
	CALL calcSubNL
	CALL DisplaySubNL
	mov ax, subDNL[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ5
	jl TQ6
TQ5:
		sub TTLD, 100
		inc TTL
TQ6:
		mov ax, subNL[bx]
		add TTL, ax
	

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09h
	lea dx, dlabel
	int 21H
	
	mov bx, 0

	mov ah, 09H
	lea dx, bv1
	int 21H
	CALL displayQtyD
	CALL CalcSubD
	CALL DisplaySubD
	mov ax, subDD[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ7
	jl TQ8
TQ7:
		sub TTLD, 100
		inc TTL
TQ8:
		mov ax, subD[bx]
		add TTL, ax
	inc bx

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, bv2
	int 21H
	CALL displayQtyD
	CALL CalcSubD
	CALL DisplaySubD
	mov ax, subDD[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ9
	jl TQ10
TQ9:
		sub TTLD, 100
		inc TTL
TQ10:
		mov ax, subD[bx]
		add TTL, ax
	inc bx

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, bv3
	int 21H
	CALL displayQtyD
	CALL CalcSubD
	CALL DisplaySubD
	mov ax, subDD[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ11
	jl TQ12
TQ11:
		sub TTLD, 100
		inc TTL
TQ12:
		mov ax, subD[bx]
		add TTL, ax
	inc bx

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, bv4
	int 21H
	CALL displayQtyD
	CALL CalcSubD
	CALL DisplaySubD
	mov ax, subDD[bx]
	add TTLD, ax
	cmp TTLD, 100
	jge TQ13
	jl TQ14
TQ13:
		sub TTLD, 100
		inc TTL
TQ14:
		mov ax, subD[bx]
		add TTL, ax

	mov ah, 09H
	lea dx, newline
	int 21H

	mov ah, 09H
	lea dx, paymentL
	int 21H
	
	mov ah, 09H
	lea dx, Rmsg1
	int 21H
	
;--- Calculate SST(3 decimal points) [Kae Lun]
	mov ax, 0
	mov bx, 0
	mov dx, 0
	
	mov ax, TTL
	mov bl, SSTTax
	mul bx
	div hundred
	mov dl, ah
	mov ah, 0
	mov taxT, ax
	
	mov ax, TTLD
	mul SSTtax
	div hundred
	mov remainder, ah
	mov ah, 0
	mov taxD, ax
	add taxD, dx
	cmp taxD, 100
	jge calT05
	jl calT06

calT05:
	sub taxD, 100
	inc taxT 
calT06:
	mov ax, 0
	mov al, remainder
	div ten
	mov thirdD, al

		mov ax, taxT
		cmp ax, 100
		jge calT07
		jl calT08

		calT07:
			div hundred
			mov ah, 02H
			add al, 30H
			mov dl, al
			int 21H
		
			mov dl, ah
			mov ax, 0	
			mov al, dl
		calT08:
			div ten
			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02H
			mov dx, "."
			int 21H

			mov ax, taxD
			div ten

			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02h
			mov dl, thirdD
			add dl, 30H
			int 21H
	
	;--- Display extra earning
	mov ah, 09H	
	lea dx, Rmsg6
	int 21H

		mov ax, extraT
		cmp ax, 100
		jge calcT22
		jl calcT23

		calcT22:
			div hundred
			mov ah, 02H
			add al, 30H
			mov dl, al
			int 21H
		
			mov dl, ah
			mov ax, 0	
			mov al, dl
		calcT23:
			div ten
			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02H
			mov dx, "."
			int 21H

			mov ax, extraTD
			div ten

			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02H
			mov dl, 30H
			int 21H
	
	;--- Display total discount amount
	mov ah, 09H
	lea dx, Rmsg2
	int 21H

	mov ax, 0
	mov bx, 0
	mov dx, 0

		mov ax, disT
		cmp ax, 100
		jge calT09
		jl calT10

		calT09:
			div hundred
			mov dl, ah
			mov ah, 02H
			add al, 30H
			mov dl, al
			int 21H
		
			mov ax, 0	
			mov al, dl
		calT10:
			div ten
			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02H
			mov dx, "."
			int 21H

			mov ax, disTD
			div ten

			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H
			mov ah, 02H
			mov dl, 30H
			int 21H


		;--- Calculate net Total
		mov ax, TTL
		add ax, taxT
		add ax, extraT
		sub ax, disT
		mov TTL, ax

		mov ax, TTLD
		add ax, taxD
		cmp ax, 100
		jge calcT16
		jl calcT17
calcT16:
	sub ax, 100
	inc TTL
calcT17:
	add ax, extraTD
	cmp ax, 100
	jge calcT20
	jl calcT21
calcT20:
	sub ax, 100
	inc TTL

calcT21:
	cmp ax, disTD
	jl calcT18
	jge calcT19

calcT18:
	dec TTL
	add ax, 100
calcT19:
	sub ax, disTD
	mov TTLD, ax

	mov al, thirdD
	add roundingVal, al
	mov ax, TTLD
	div ten
	mov al, ah
	mov ah, 0
	mul ten
	add roundingVal, al 
	cmp roundingVal, 50
	jge calT11
	jl calT12
calT11:
	mov dx, 0
	mov ax, TTLD
	mul ten
	mov dl, thirdD
	add ax, dx
	mov dl, roundingVal
	sub ax, dx
	add ax, 100
	div ten
	mov ah, 0
	mov TTLD, ax

	cmp TTLD, 100
	jge calT18
	jl calT17
calT18:
	inc TTL
	sub TTLD, 100
calT17:
	mov ah, 09H
	lea dx, Rmsg5
	int 21H

	mov dx, 0
	mov ax, 100
	mov dl, roundingVal
	sub ax, dx
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H
	
	jmp calT13

calT12:
	mov dx, 0
	mov ax, TTLD
	mul ten
	mov dl, thirdD
	add ax, dx
	mov dl, roundingVal
	sub ax, dx
	div ten
	mov ah, 0
	mov TTLD, ax
	
	;--- Display rounding adjustment
	mov ah, 09h
	lea dx, Rmsg4
	int 21H
	
	mov ax, 0
	mov al, roundingVal
	div ten
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

calt13:	

		;--- display Total
		mov ah, 09H
		lea dx, Rmsg3
		int 21H

		mov ax, 0
		mov ax, TTL
		cmp ax, 1000
		jge calT16
		cmp ax, 100
		jge calT14
		jl calT15
	
		calT16:
			div hundred
			mov bl, ah

			mov ah, 0
			div ten
			mov quotient, al
			add quotient, 30H
			mov remainder, ah
			add remainder, 30H
			
			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H
		
			mov ax, 0	
			mov al, bl
			jmp calT15

		calT14:
			div hundred
			mov quotient, al
			mov remainder, ah
			mov ah, 02H
			add quotient, 30H
			mov dl, quotient
			int 21H
		
			mov ax, 0	
			mov al, remainder
		calT15:
			div ten
			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

			mov ah, 02H
			mov dx, "."
			int 21H

			mov ax, TTLD
			div ten

			add al, 30H
			mov quotient, al
			add ah, 30H
			mov remainder, ah

			mov ah, 02H
			mov dl, quotient
			int 21H

			mov ah, 02H
			mov dl, remainder
			int 21H

	mov ah, 09H
	lea dx, sale
	int 21H

	;--- cmp subtotal to get the best-selling nasi lemak
	;--- considering decimal point all will be converted into whole number
	mov ax, 0
	mov bx, 0
	mov si, 0
	mov cx, 3
qtyCMB:
	mov al, qtyNLH[bx]
	mul hundred
	add al, qtyNL[bx]
	mov compareVal[si], ax
	inc bx
	add si, 2
	Loop qtyCMB

	mov ax, 0
	mov ax, compareVal[0]
	cmp ax, compareVal[2]
	jg index1
	jle index2
index1:
	mov ax, compareVal[4]
	cmp compareVal[0], ax			;--- 1/3(self-reference)
	jg index3
	jle index5
index2:
	mov ax, compareVal[4]
	cmp compareVal[2], ax	;--- 2/3(self-reference)
	jg index4
	jle index5		
index3:
	mov Findex, 1
	jmp finalIndex
index4:
	mov Findex, 2
	jmp finalIndex
index5:
	mov Findex, 3
	jmp finalIndex

finalIndex:
	mov bx, 0
	mov bl, Findex
	dec bx
	cmp compareVal[bx], 0
	Je cmp0

	mov ah, 02H
	mov dl, Findex
	add dl, 30H
	int 21H
	mov dl, " "
	int 21H
	mov dl, "!"
	int 21H
	jmp fnshCMP

cmp0:
	mov ah, 02H
	mov dl, "?"
	int 21H
	jmp fnshCMP

fnshCMP:
	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	INC numofReport
	jmp reportF

	

expenses:
	;--- Clear Screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, R2title
	int 21H

	;--- get Today's DATE
	mov ah, 2ah
	int 21H

	mov day, dl
	mov month, dh
	mov year, cx

	mov ax, 0
	mov dx, 0
	mov cx, 0
	mov bx, 0
	CALL displayDate

	mov ah, 09H
	lea dx, expH
	int 21H
	
	mov bx, 0
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset fd1
	int 21H
	
	CALL Drefqty

	add bx, 2
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset fd2
	int 21H

	CALL Drefqty

	add bx, 2
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset fd3
	int 21H

	CALL Drefqty

	mov bx, 0
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset bv1
	int 21H

	CALL Drebqty

	add bx, 2
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset bv2
	int 21H

	CALL Drebqty

	add bx, 2
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset bv3
	int 21H

	CALL Drebqty

	add bx, 2
	mov ah, 02H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov dl, " "
	int 21H
	mov ah, 09H
	mov dx, offset bv4
	int 21H

	CALL Drebqty
	
	mov ah, 09H
	lea dx, expL
	int 21H

	mov ah, 09H
	lea dx, Rmsg7
	int 21H

	cmp Sprice, 100
	jge Sp01
	jl Sp02
		
	Sp01:
		mov dx, 0
		mov ax, Sprice
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp Sp03

	Sp02:
		mov ah, 02H
		mov dl, 20H
		int 21H

		mov ax, Sprice

	Sp03:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov al, SpriceD
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H
	INC numofReport
		jmp reportF
	
;------------ Summary
sumry:
	mov ax, 0600H
	mov bh, 07H
	mov cx, 0000H
	mov dx, 184FH
	int 10H

	mov ah, 02H
	mov bh, 00
	mov dx, 0000H
	int 10H

	mov ah, 09H
	lea dx, summary
	int 21H
	
	;--- Number of registration
	mov ah, 09H
	lea dx, memreg
	int 21H

	mov ax, 0
	mov al, numofReg
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of Login
	mov ah, 09H
	lea dx, memlogin
	int 21H

	mov ax, 0
	mov al, numofLogin
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of MemOrder

	mov ah, 09H
	lea dx, memOrder
	int 21H

	mov ax, 0
	mov al, numofMemO
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H
	
	;--- Number of guestOrder
	mov al, numofGuestO
	sub al, numofMemO
	mov numofGuestO, al
	mov ah, 09H
	lea dx, guestOrder
	int 21H

	mov ax, 0
	mov al, numofGuestO
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of Cancel
	mov ah, 09H
	lea dx, canOrder
	int 21H

	mov ax, 0
	mov al, numofCancel
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of Restocking
	mov ah, 09H
	lea dx, restockMsg
	int 21H

	mov ax, 0
	mov al, numofRestock
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of Price Adjustment
	mov ah, 09H
	lea dx, priceAdjust
	int 21H

	mov ax, 0
	mov al, numofPA
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	;--- Number of Report Generated
	mov ah, 09H
	lea dx, reporting
	int 21H

	mov ax, 0
	mov al, numofReport
	div ten
	
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	mov ah, 09H
	lea dx, space3
	int 21H

	mov ah, 09H
	lea dx, summaryL
	int 21H

	mov ah, 09H
	lea dx, bsmsg
	int 21H
	mov ah, 01H
	int 21H
	
		jmp exit

;------------ FUNCTION MENU
;------ Order Function
;--- Display food & beverage price
DisplayPrice:
	mov ax, 0
	mov al, [si]
	inc si
	div divisor
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H

	mov ah, 02H
	mov dx, "."
	int 21H

	mov ax, 0
	mov al, [di]
	inc di
	div divisor
	add al, 30H
	mov quotient, al
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, quotient
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H
	ret

;--- Display subtotal for food price
DisplaySubtotalf:
	mov cl, fqty[bx]
	mov ax, 0
	subtotalf:
		mov al, fpriceD[bx]
		add subTDf[bx], ax
		cmp subTDf[bx], 100
		jge jump1
		jl jump2

		jump1:
			sub subTDf[bx], 100
			add subTf[bx], 1

		jump2:
			mov al, fprice[bx]
			add subTf[bx], ax
		loop subtotalf

	cmp subTf[bx], 100
	jge jump3
	jl jump4
		
	jump3:
		mov dx, 0
		mov ax, subTf[bx]
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp jump5

	jump4:
		mov ah, 02H
		mov dl, 20H
		int 21H

		mov ax, subTf[bx]

	jump5:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov ax, subTDf[bx]
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
	ret

;--- Display subtotal for beverage price
DisplaySubtotalb:
	mov cl, bqty[bx]
	mov ax, 0
	subtotalb:
		mov al, bpriceD[bx]
		add subTDb[bx], ax
		cmp subTDb[bx], 100
		jge jump6
		jl jump7

		jump6:
			sub subTDb[bx], 100
			add subTb[bx], 1

		jump7:
			mov al, bprice[bx]
			add subTb[bx], ax
		loop subtotalb

	cmp subTb[bx], 100
	jge jump8
	jl jump9
		
	jump8:
		mov dx, 0
		mov ax, subTb[bx]
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp jump10

	jump9:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ax, subTb[bx]

	jump10:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov ax, subTDb[bx]
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
	ret

;--- Display Fqty
DisplayFqty:
	cmp fqty[bx], 10
	jge L10
	jl L11
	L10:
		mov ax, 0
		mov al, fqty[bx]
		div ten
		add al, 30H
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp L12

	L11:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ah, 02H
		mov dl, fqty[bx]
		add dl, 30H
		int 21H

	L12:
		mov ah, 09H
		lea dx, space1
		int 21H
	
	ret

;--- Display Bqty
DisplayBqty:
	cmp bqty[bx], 10
	jge L13
	jl L14
	L13:
		mov ax, 0
		mov al, bqty[bx]
		div ten
		add al, 30H
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp L15

	L14:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ah, 02H
		mov dl, bqty[bx]
		add dl, 30H
		int 21H

	L15:
		mov ah, 09H
		lea dx, space1
		int 21H
	ret

;------ Restock Function
;--- Display Food & beverage stock qty
Displayfbsqty:
	mov ax, [si]
	div hundred
	add al, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, al
	int 21H

	mov ax, 0
	mov al, remainder
	div ten
	add al, 30H
	add ah, 30H
	mov remainder, ah

	mov ah, 02H
	mov dl, al
	int 21H

	mov ah, 02H
	mov dl, remainder
	int 21H
	add si, 2
	ret

	;------ Get restock qty
getSqty:
	mov ah, 02H
	mov bh, 00
	mov dx, 1132H
	int 10H
	mov sqtyIN[0],0
	mov sqtyIN[1],0
	mov sqtyIN[2],0
	mov sqtyIN[3],0
getS:
	mov ax, 0
	mov ah, 01H
	int 21H
	cmp al, 0dH
	je restockConfirm
	cmp al, 0aH
	je restockConfirm
	sub al, 30H
	mov sqtyIN[si], al

	cmp al, 0
	jl L115
	cmp al, 9
	jg L115

	inc si
	loop getS
	cmp al, 0dH
	jne L115
	cmp al, 0aH
	jne L115

	;------ Get restock qty Confirmation
restockConfirm:
	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R9
	cmp al, "y"
	je R9
	cmp al, "N"
	je L114
	cmp al, "n"
	je L114
	jne errormsgrs1
R9:
	mov ah, 09H
	lea dx, newLine
	int 21H

	cmp si, 1
	je L98
	cmp si, 2
	je L99
	cmp si, 3
	je L100

	L115:
		jmp errormsgrs

	L98:
		mov ax, 0
		mov al, sqtyIN[0]
		mov sqty, ax
		jmp getSprice

	L99:
		mov ax, 0
		mov al, sqtyIN[0]
		mul ten
		mov sqty, ax

		mov ax, 0
		mov al, sqtyIN[1]
		add sqty, ax
		jmp getSprice
	L100:
		mov ax, 0
		mov al, sqtyIN[0]
		mul hundred
		mov sqty, ax

		mov ax, 0
		mov al, sqtyIN[1]
		mul ten
		add sqty, ax

		mov ax, 0
		mov al, sqtyIN[2]
		add sqty, ax
		jmp getSprice
L114:
	jmp rmenu

	errormsgrs1:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgconf
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		lea dx, BSmsg
		int 21H
		mov ah, 01h
		int 21H
		mov ax, 0600H
		mov bh, 07H
		mov cx, 1132H
		mov dx, 184FH
		int 10H
		mov ax, 0600H
		mov bh, 07H
		mov cx, 1200H
		mov dx, 184FH
		int 10H
		mov ah, 02H
		mov bh, 00
		mov dx, 1132H
		int 10H
		mov cx, 4
		mov si, 0
		jmp getsqty

	errormsgrs:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgcs
		int 21H

		mov ah, 09H
		lea dx, newLine
		int 21H
		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		lea dx, BSmsg
		int 21H
		mov ah, 01h
		int 21H

		mov ax, 0600H
		mov bh, 07H
		mov cx, 1132H
		mov dx, 184FH
		int 10H
		mov ax, 0600H
		mov bh, 07H
		mov cx, 1200H
		mov dx, 184FH
		int 10H
		mov ah, 02H
		mov bh, 00
		mov dx, 1132H
		int 10H
		mov cx, 4
		mov si, 0
		jmp getsqty

	L140:
		mov ah, 09H
		lea dx, newline
		int 21H

		mov ah, 09H
		lea dx, eromsgc
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H

		mov ah, 09H
		lea dx, BSmsg
		int 21H

		mov ah, 01H
		int 21H
		jmp getSprice

	L108:
		jmp errormsgrsp

;--- Get price used to restock
getSprice:
	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1300H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1300H
	int 10H

	mov ah, 09H
	lea dx, promptsp
	int 21H

	mov cx, 4
	mov si, 0
	mov bx, 0
L101:
	mov ah, 01H
	int 21H
	cmp al, "."
	je L102
	sub al, 30H
	mov stockIN[si], al

	cmp al, 0
	jl L108
	cmp al, 9
	jg L108

	inc si
	loop L101
	cmp cx, "."
	jne L140

L102:
	mov cx, 2
L103:
	mov ah, 01H
	int 21H
	sub al, 30H
	mov stockIND[bx], al

	cmp al, 0
	jl L108
	cmp al, 9
	jg L108

	inc bx
	loop L103

	mov ax, 0
	mov al, stockIND[0]
	mul ten
	add al, stockIND[1]
	add spriceD, al
	cmp spriceD, 100
	jge L134
	jl L135
	L134:
		sub spriceD, 100
		inc sprice
	L135:
	;------ Confirmation
spriceConfirm:
	mov ah, 09H
	lea dx, newLine
	int 21H

	mov ah, 09H
	lea dx, conf
	int 21H

	mov ah, 01H
	int 21H

	cmp al, "Y"
	je R10
	cmp al, "y"
	je R10
	cmp al, "N"
	je L136
	cmp al, "n"
	je L136
	jne errormsgrsp1
L136:
	jmp getSprice
R10:
	mov ah, 09H
	lea dx, newLine
	int 21H

	cmp si, 1
	je L104
	cmp si, 2
	je L105
	cmp si, 3
	je L106
	L104:
		mov ax, 0
		mov al, stockIN[0]
		add sprice, ax
		jmp BS
	L105:
		mov ax, 0
		mov al, stockIN[0]
		mul ten
		add sprice, ax

		mov ax, 0
		mov al, stockIN[1]
		add sprice, ax
		jmp BS
	L106:
		mov ax, 0
		mov al, stockIN[0]
		mul hundred
		add sprice, ax

		mov ax, 0
		mov al, stockIN[1]
		mul ten
		add sprice, ax

		mov ax, 0
		mov al, stockIN[2]
		add sprice, ax
		jmp BS

	errormsgrsp1:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgconf
		int 21H
		
		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		lea dx, BSmsg
		int 21H
		mov ah, 01h
		int 21H

		jmp getsprice

	errormsgrsp:
		mov ah, 09H
		lea dx, newLine
		int 21H

		mov ah, 09H
		lea dx, eromsgc
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		lea dx, BSmsg
		int 21H
		mov ah, 01h
		int 21H

		jmp getsprice
BS:
	ret

;------ Price adjustment Functions 

;--- Read value input [Kae Lun]
ValInput:
	;--- read input into value array
	mov cx, 2		; loop twice for input of wholePart
	mov bx, 0
	Whole:	
		mov ah, 01H
		int 21H
		cmp al, 0dH
		je valAgain
		sub al, 30H
		mov value[bx], al	; value[0] = al
		inc bx
		loop Whole

		;--- display "."
		mov ah, 02H
		mov dl, "."
		int 21H

		mov cx, 2		; reset to loop twice for fractionPart
		mov bx, 2
	Fraction:
		mov ah, 01H
		int 21H
		cmp al, 0dH
		je valAgain
		sub al, 30H
		mov value[bx], al
		inc bx
		loop fraction
		jmp backVal
	valAgain:
		mov ah, 02H
		mov dx, newline
		int 21H

		mov cx, 0
		mov ah, 09H	
		lea dx, chkval
		int 21H

		mov ah, 09H
		lea dx, newline
		int 21H
		mov ah, 09H
		lea dx, BSmsg
		int 21H
		mov ah, 01h
		int 21H
		;--- Clear screen
		mov ax, 0600H
		mov bh, 07H
		mov cx, 132EH
		mov dx, 184FH
		int 10H
		mov ax, 0600H
		mov bh, 07H
		mov cx, 1500H
		mov dx, 184FH
		int 10H
		mov ah, 02H
		mov bh, 00
		mov dx, 132EH
		int 10H
		jmp Valinput
	backVal:

		RET


;--- Carry value from decimal point(Food) [Kae Lun]
Carry:
	;--- add 1 for wholePart, minus 100 for fractionPart 
	sub ax, 100
	mov fpriceD[bx], al
	inc fprice[bx]
	RET

FCarry1:
	sub ax, 100
	inc fprice[si]
	RET	


FCarry2:
	sub bx, 100
	inc fprice[si]
	RET	

;--- Carry value from decimal point(Beverage) [Kae Lun]
BCarry:
	;--- add 1 for wholePart, minus 100 for fractionPart 
	sub ax, 100
	mov BpriceD[bx], al
	inc Bprice[bx]
	RET

BPCarry1:
	sub ax, 100
	inc Bprice[si]
	RET	


BPCarry2:
	sub dx, 100
	inc Bprice[si]
	RET	

;--- Prompt and Read Percentage [Kae Lun]
inputPercent:
	mov accP, 0
	mov percentage[0], 0
	mov percentage[1], 0
	mov percentage[2], 0
	mov percentage[3], 0

	;--- input percentage

inP:
	mov ah, 0AH
	lea dx, percentage_list
	int 21H 

	mov bl, actP
	dec bx
	mov cx, bx
	mov si, 0
	
check:
	cmp percentage[bx], "%"
	je check2
	
errorInput5:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov cx, 0
	mov ah, 09H	
	lea dx, chkval
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H

	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1420H
	mov dx, 184FH
	int 10H
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1500H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1420H
	int 10H

	jmp inputPercent

check2:
	cmp percentage[si], 30H
	jl errorInput5
	cmp percentage[si], 39H
	jg errorInput5
	sub percentage[si], 30H
	inc si
	Loop check2

	cmp percentage[1], "%"
	je calcP1
	cmp percentage[2], "%"
	je calcP2
	cmp percentage[3], "%"
	je calcP3
calcP1:
	mov ax, 0
	mov al, percentage[0]
	mov accP, ax
	jmp backP

calcP2:
	mov ax, 0
	mov al, percentage[0]
	mul ten
	add al, percentage[1]
	mov accP , ax
	jmp backP

calcP3:
	mov ax, 0
	mov al, percentage[0]
	mul ten
	add al, percentage[1]
	mul ten
	add al, percentage[2]
	mov accP, ax
	cmp accP, 200
	jg errorInput6
	jmp backP

errorInput6:
	mov ah, 02H
	mov dx, newline
	int 21H

	mov ah, 09H
	lea dx, chkP
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	mov ah, 09H
	lea dx, BSmsg
	int 21H
	mov ah, 01h
	int 21H

	;--- Clear screen
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1420H
	mov dx, 184FH
	int 10H
	mov ax, 0600H
	mov bh, 07H
	mov cx, 1500H
	mov dx, 184FH
	int 10H
	mov ah, 02H
	mov bh, 00
	mov dx, 1420H
	int 10H
	jmp inputPercent

backP:
	mov si, 0
	mov ax, 0
	mov bx, 0
	mov cx, 0
	mov di, 0
	RET

;------ Display Qty [Kae Lun]
DisplayQtyNL:
	cmp qtyNLH[bx], 0
	jg QTY4
	cmp qtyNL[bx], 10
	jge QTY1
	jl QTY2

	QTY4:
		mov ax, 0
		mov al, qtyNLH[bx]

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, qtyNL[bx]
		div ten
		mov remainder, ah
		mov quotient, al
		add remainder, 30H
		add quotient, 30H

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp QTY3
		
	QTY1:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ax, 0
		mov al, qtyNL[bx]
		div ten
		add al, 30H
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp QTY3

	QTY2:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ah, 02H
		mov dl, 20H	; space
		int 21H
		
		mov ax, 0
		mov al, qtyNL[bx]

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

	QTY3:
		mov ah, 09H
		lea dx, space1
		int 21H
	ret

DisplayQtyD:
	cmp qtyDH[bx], 100
	jge QTY5
	cmp qtyD[bx], 10
	jge QTY6
	jl QTY7

	QTY5:
		mov ax, 0
		mov al, qtyDH[bx]

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, qtyD[bx]
		div ten
		mov remainder, ah
		mov quotient, al
		add remainder, 30H
		add quotient, 30H

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp QTY3
		
	QTY6:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ax, 0
		mov al, qtyD[bx]
		div ten
		add al, 30H
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H
		jmp QTY8

	QTY7:
		mov ah, 02H
		mov dl, 20H	; space
		int 21H

		mov ah, 02H
		mov dl, 20H	; space
		int 21H
		
		mov ax, 0
		mov al, qtyD[bx]

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

	QTY8:
		mov ah, 09H
		lea dx, space1
		int 21H
	ret

;--- Report calculate subtotal & total function [Kae Lun]
CalcSubNL:

	cmp qtyNLH[bx], 0
	jne us1
	cmp qtyNL[bx], 0
	je n01

us1:
	mov al, qtyNLH[bx]
	mul hundred
	add al, qtyNL[bx]
	mov cx, ax
	calcSub:
		mov al, fpriceD[bx]
		add subDNL[bx], ax
		cmp subDNL[bx], 100
		jge addSUBNL
		jl  conSUBNL
		addSUBNL:	
			sub subDNL[bx], 100
			inc subNL[bx]
		conSUBNL:
			mov al, fprice[bx]
			add subNL[bx], ax

	Loop calcSub
n01:
	RET

DisplaySubNL:

	cmp subNL[bx], 100
	jge dis1
	jl dis2
		
	dis1:
		mov dx, 0
		mov ax, subNL[bx]
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp dis3

	dis2:
		mov ah, 02H
		mov dl, 20H
		int 21H

		mov ax, subNL[bx]

	dis3:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov ax, subDNL[bx]
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dl, " "
		int 21H		
		mov ah, 02H
		mov dl, " "
		int 21H		
		mov ah, 02H
		mov dl, " "
		int 21H
		mov ah, 02H
		mov dl, " "
		int 21H
		mov dl, " "
		int 21H
		mov dl, "|"
		int 21H
	ret	

CalcSubD:
	cmp qtyDH[bx], 0
	jne us2
	cmp qtyD[bx], 0
	je n02
us2:
	mov al, qtyDH[bx]
	mul hundred
	add al, qtyD[bx]
	mov cx, ax
	calcSub2:
		mov al, BpriceD[bx]
		add subDD[bx], ax
		cmp subDD[bx], 100
		jge addSUBD
		jl  conSUBD
		addSUBD:	
			sub subDD[bx], 100
			inc subD[bx]
		conSUBD:
			mov al, Bprice[bx]
			add subD[bx], ax
	
	Loop calcSub2
n02:
	RET

DisplaySubD:

	cmp subD[bx], 100
	jge dis6
	jl dis4
		
	dis6:
		mov dx, 0
		mov ax, subD[bx]
		div hundred
		mov remainder, ah

		mov ah, 02H
		mov dl, al
		add dl, 30H
		int 21H

		mov al, remainder
		mov ah, 0
		jmp dis5

	dis4:
		mov ah, 02H
		mov dl, 20H
		int 21H

		mov ax, subD[bx]

	dis5:
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dx, "."
		int 21H

		mov ax, 0
		mov ax, subDD[bx]
		div ten
		add al, 30H
		mov quotient, al
		add ah, 30H
		mov remainder, ah

		mov ah, 02H
		mov dl, quotient
		int 21H

		mov ah, 02H
		mov dl, remainder
		int 21H

		mov ah, 02H
		mov dl, " "
		int 21H		
		mov ah, 02H
		mov dl, " "
		int 21H		
		mov ah, 02H
		mov dl, " "
		int 21H
		mov ah, 02H
		mov dl, " "
		int 21H
		mov dl, " "
		int 21H
		mov dl, "|"
		int 21H
	ret	
Drefqty:
	mov ax, 0
	mov ax, reFqty[bx]

	div hundred
	mov remainder, ah
	mov quotient, al
	
	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H
	mov ax, 0
	mov al, remainder

	div ten
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	
	mov ah, 02H
	mov dl, " "
	int 21H
	mov ah, 02H
	mov dl, " "
	int 21H
	mov ah, 02H
	mov dl, " "
	int 21H

	mov ah, 02H
	mov dl, "|"
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	ret

Drebqty:
	mov ax, rebqty[bx]

	div hundred
	mov remainder, ah
	mov quotient, al
	
	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H
	mov ax, 0
	mov al, remainder

	div ten
	mov remainder, ah
	mov quotient, al

	mov ah, 02H
	mov dl, quotient
	add dl, 30H
	int 21H

	mov ah, 02H
	mov dl, remainder
	add dl, 30H
	int 21H
	
	mov ah, 02H
	mov dl, " "
	int 21H
	mov ah, 02H
	mov dl, " "
	int 21H

	mov ah, 02H
	mov dl, " "
	int 21H

	mov ah, 02H
	mov dl, "|"
	int 21H

	mov ah, 09H
	lea dx, newline
	int 21H
	ret

displayDate:

	mov al, day
	div ten

	mov quotient, al
	add quotient, 30H
	mov remainder, ah
	add remainder, 30H

	mov ah, 02H
	mov dl, quotient
	int 21H
	mov dl, remainder
	int 21H

	mov dl, "-"
	int 21H

	mov ax, 0
	mov al, month
	div ten

	mov quotient, al
	add quotient, 30H
	mov remainder, ah
	add remainder, 30H

	mov ah, 02H
	mov dl, quotient
	int 21H
	mov dl, remainder
	int 21H

	mov dl, "-"
	int 21H

	mov dx, 0
	mov ax, year
	div hundred2
	div ten
	
	mov quotient, al
	add quotient, 30H
	mov remainder, ah
	add remainder, 30H

	mov ah, 02H
	mov dl, quotient
	int 21H
	mov dl, remainder
	int 21H

	mov ax, dx
	sub ax, 27
	div ten
	mov quotient, al
	add quotient, 30H
	mov remainder, ah
	add remainder, 30H

	mov ah, 02H
	mov dl, quotient
	int 21H
	mov dl, remainder
	int 21H
	RET
	

;------ Terminate Program
exit:
	mov ah, 4ch
	int 21h

main endp
end main