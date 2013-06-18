/// <reference path="../IntlDate.js"/>

// class PersianDate extends IntlDateBase
// PersianDate(year, month, date[, hours[, minutes[, seconds]]])
// PersianDate(msTicks)

PersianDate.extend(IntlDateBase);
function PersianDate(year, month, day, hr, min, sec) {
	// If 'new' keyword not used on this constructor, create a new instance. This usage is
	// discouraged but it is implemented here to be consistent with the behavior of
    // Date(). Notice that if 'new' keyword is not used, then any arguments are ignored.
    if (this.constructor.name === constructor.name) {
	    this.constructor.name = "PersianDate";
	};
	this.caltype = "Persian"; // 4
	this.base();
}

// static properties
PersianDate.calName = "Persian";
PersianDate.defaultDigitShape = 2;

// PersianDate Date.toPersianDate()
Date.prototype.toPersianDate = DateToPersianDate;
function DateToPersianDate(lateInit) {
	if (lateInit)
		return new PersianDate(this.getTime());
	var year, month, day, hr, min, sec, ymd;
	year = this.getFullYear();
	month = this.getMonth();
	day = this.getDate();
	hr = this.getHours();
	min = this.getMinutes();
	sec = this.getSeconds();
	ymd = gregorian_to_jalali([year, month+1, day]);
	year = ymd[0]; month = ymd[1]-1; day = ymd[2];
	if (isNaN(year) || isNaN(month) || isNaN(day))
		return null;
	var date = new PersianDate(year, month, day, hr, min, sec);
	date.msTime = this.getTime();
	date.dow = this.getDay();
	return date;
}

// override
// Date PersianDate.toDate()
PersianDate.prototype.toDate = PersianDateToDate;
function PersianDateToDate() {
	if (this.msTime != null)
		return new Date(this.msTime);
	this.ensureFlat();
	if (!this.validRange())
		return null;
	var year, month, day, hr, min, sec, ymd;
	year = this.getFullYear();
	month = this.getMonth();
	day = this.getDate();
	hr = this.getHours();
	min = this.getMinutes();
	sec = this.getSeconds();
	ymd = jalali_to_gregorian([year, month+1, day]);
	year = ymd[0]; month = ymd[1]-1; day = ymd[2];
	if (isNaN(year) || isNaN(month) || isNaN(day))
		return null;
	var date = new Date(year, month, day, hr, min, sec);
//    if (year != date.getFullYear() || month != date.getMonth() || day != date.getDate())
//        return null;
	date.setHours(hr, min, sec, 0);
	return date;
}

// override
// <IntlDate> PersianDate.getLocaleDate(Date date)
PersianDate.prototype.getLocaleDate = PersianDateGetLocaleDate;
function PersianDateGetLocaleDate(date) {
	return date.toPersianDate();
}

// override
// Boolean PersianDate.validRange()
PersianDate.prototype.validRange = PersianDateValidRange;
function PersianDateValidRange() {
	var yrMin, yrMax, year, month, day, hr, min, sec;
	year = this.yr;
	month = this.mon + 1;
	day = this.day;
	if (isNaN(year) || isNaN(month) || isNaN(day))
		return false;
	//yrMin = 1178;
	//yrMax = 1468;
	//if ((year < yrMin || year > yrMax) ||
	if (month < 1 || month > 12 ||
		day < 1 || day > this.getDaysInMonth(year, month))
		return false;
	return true;
}

// override
// Number PersianDate.getDaysInMonth(Number year, Number month)
PersianDate.prototype.getDaysInMonth = PersianDateGetDaysInMonth;
function PersianDateGetDaysInMonth(year, month) {
	if (month < 1 || month > 12) return 0;
	if (month < 7) return 31;
	if (month < 12) return 30;
	if (this.isLeapYear(year)) return 30;
	return 29;
}

// override
// Boolean PersianDate.isLeapYear(Number year)
PersianDate.prototype.isLeapYear = PersianDateIsLeapYear;
function PersianDateIsLeapYear(year) {
	year = Math.abs(fix(year));
	return ((year*8+29)%33) < 8;
}

// override
// String PersianDate.toDateString()
PersianDate.prototype.toDateString = PersianDateToDateString;
function PersianDateToDateString()
{
	return this.getFullYear() +"/"+ (this.getMonth()+1) +"/"+ this.getDate();
}

// override
// String PersianDate.toTimeString()
PersianDate.prototype.toTimeString = PersianDateToTimeString;
function PersianDateToTimeString()
{
	return this.getHours() +":"+ this.getMinutes() +":"+ this.getSeconds();
}

// override
// String PersianDate.toString()
PersianDate.prototype.toString = PersianDateToString;
function PersianDateToString()
{
	return this.toDateString() +"  "+ this.toTimeString();
}

// override
// String PersianDate.toLocaleDateString()
PersianDate.prototype.toLocaleDateString = PersianDateToLocaleDateString;
function PersianDateToLocaleDateString()
{
	return this.toDateString()
		.changeDigitShapes(Calendar.digitShape);
}

// override
// String PersianDate.toLocaleTimeString()
PersianDate.prototype.toLocaleTimeString = PersianDateToLocaleTimeString;
function PersianDateToLocaleTimeString()
{
	return this.toTimeString()
		.changeDigitShapes(Calendar.digitShape);
}

// override
// String PersianDate.toLocaleString()
PersianDate.prototype.toLocaleString = PersianDateToLocaleString;
function PersianDateToLocaleString()
{
	return this.toString()
		.changeDigitShapes(Calendar.digitShape);
}

// override
// String PersianDate.toUTCString()
PersianDate.prototype.toUTCString = PersianDateToUTCString;
function PersianDateToUTCString()
{
	var str = this.getUTCFullYear() +"/"+ (this.getUTCMonth()+1) +"/"+ this.getUTCDate() +
		"  "+ this.getUTCHours() +":"+ this.getUTCMinutes() +":"+ this.getUTCSeconds();
	return str;
}

// Helper methods for this calendar

/* jalali.js  Gregorian to Jalali and inverse date convertor
 * Copyright (C) 2001  Roozbeh Pournader <roozbeh@sharif.edu>
 * Copyright (C) 2001  Mohammad Toossi <mohammad@bamdad.org>
 * Copyright (C) 2003  Behdad Esfahbod <js@behdad.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You can receive a copy of GNU Lesser General Public License at the
 * World Wide Web address <http://www.gnu.org/licenses/lgpl.html>.
 *
 * For licensing issues, contact The FarsiWeb Project Group,
 * Computing Center, Sharif University of Technology,
 * PO Box 11365-8515, Tehran, Iran, or contact us the
 * email address <FWPG@sharif.edu>.
 */

/* Changes:
 * 
 * 2003-Mar-29:
 *      Ported to javascript by Behdad Esfahbod
 *
 * 2001-Sep-21:
 *	Fixed a bug with "30 Esfand" dates, reported by Mahmoud Ghandi
 *
 * 2001-Sep-20:
 *	First LGPL release, with both sides of conversions
 */
 
g_days_in_month = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
j_days_in_month = new Array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);
 
function div(a,b) {
  return Math.floor(a/b);
}

function gregorian_to_jalali(g /* array containing year, month, day*/ )
{
   var gy, gm, gd;
   var jy, jm, jd;
   var g_day_no, j_day_no;
   var j_np;
 
   var i;

   gy = g[0]-1600;
   gm = g[1]-1;
   gd = g[2]-1;

   g_day_no = 365*gy+div((gy+3),4)-div((gy+99),100)+div((gy+399),400);
   for (i=0;i<gm;++i)
	  g_day_no += g_days_in_month[i];
   if (gm>1 && ((gy%4==0 && gy%100!=0) || (gy%400==0)))
	  /* leap and after Feb */
	  ++g_day_no;
   g_day_no += gd;
 
   j_day_no = g_day_no-79;
 
   j_np = div(j_day_no, 12053);
   j_day_no %= 12053;
 
   jy = 979+33*j_np+4*div(j_day_no,1461);
   j_day_no %= 1461;
 
   if (j_day_no >= 366) {
	  jy += div((j_day_no-1),365);
	  j_day_no = (j_day_no-1)%365;
   }
 
   for (i = 0; i < 11 && j_day_no >= j_days_in_month[i]; ++i) {
	  j_day_no -= j_days_in_month[i];
   }
   jm = i+1;
   jd = j_day_no+1;

   return new Array(jy, jm, jd);
}

function jalali_to_gregorian(j /* array containing year, month, day*/ )
{
   var gy, gm, gd;
   var jy, jm, jd;
   var g_day_no, j_day_no;
   var leap;

   var i;

   jy = j[0]-979;
   jm = j[1]-1;
   jd = j[2]-1;

   j_day_no = 365*jy + div(jy,33)*8 + div((jy%33+3),4);
   for (i=0; i < jm; ++i)
	  j_day_no += j_days_in_month[i];

   j_day_no += jd;

   g_day_no = j_day_no+79;

   gy = 1600 + 400*div(g_day_no,146097); /* 146097 = 365*400 + 400/4 - 400/100 + 400/400 */
   g_day_no = g_day_no % 146097;

   leap = 1;
   if (g_day_no >= 36525) /* 36525 = 365*100 + 100/4 */
   {
	  g_day_no--;
	  gy += 100*div(g_day_no,36524); /* 36524 = 365*100 + 100/4 - 100/100 */
	  g_day_no = g_day_no % 36524;
	  
	  if (g_day_no >= 365)
		 g_day_no++;
	  else
		 leap = 0;
   }

   gy += 4*div(g_day_no,1461); /* 1461 = 365*4 + 4/4 */
   g_day_no %= 1461;

   if (g_day_no >= 366) {
	  leap = 0;

	  g_day_no--;
	  gy += div(g_day_no, 365);
	  g_day_no = g_day_no % 365;
   }

   for (i = 0; g_day_no >= g_days_in_month[i] + (i == 1 && leap); i++)
	  g_day_no -= g_days_in_month[i] + (i == 1 && leap);
   gm = i+1;
   gd = g_day_no+1;

   return new Array(gy, gm, gd);
}

function jalali_today() {
  Today = new Date();
  j = gregorian_to_jalali(new Array(
						  Today.getFullYear(),
						  Today.getMonth()+1,
						  Today.getDate()
						  ));
  return j[2]+"/"+j[1]+"/"+j[0];
}
