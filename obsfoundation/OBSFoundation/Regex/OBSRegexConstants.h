/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 26/01/2010
 *
 * ****************************************************************/

#define ANYTHING			@".*"
#define DIGIT				@"[0-9]"
#define NUMBER				@"[0-9]+"
#define POSITIVENUMBER		@"[1-9][0-9]*"
#define CHAR				@"[a-zA-Z]{1}"
#define TWOCHARS			@"[a-zA-Z]{2}"
#define DECIMALNUMBER		@"[0-9]+[.[,]][0-9]+"
#define CURRENCY			@"[0-9]+[.]{0,1}[0-9]{0,2}"
#define FLOAT				@"[0-9]+[.][0-9]+"
#define ALPHANUMERIC		@"[0-9[a-zA-Z]]+"
#define DATE				@"(0[1-9]|[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012]|[1-9])/(19|20)\\d{2}"
#define TIME				@"^([0-1]{0,1}[0-9]|[2][0-3]):([0-5][0-9])$"
#define TAG					@"<[\\w[^<[>]]]*>"
#define EMAIL				@".+@{1}.+\\.[a-z]+"
#define ROMANNUMBER			@"[XVCIM]{1,}"
