using System.ServiceProcess;

/*
 * Copyright (C) 2010 Svante Seleborg/Axantum Software AB, All rights reserved.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms
 * of the GNU General Public License as published by the Free Software Foundation;
 * either version 2 of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA
 * 
 * If you wish to use this program under different terms, please contact the author.
 * 
 * The author may be reached at mailto:svante@axantum.com and http://www.axantum.com
 *
 */
namespace Log4netRemotingServerService
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[] 
			{ 
				new Log4netRemotingServerService() 
			};
            ServiceBase.Run(ServicesToRun);
        }
    }
}
