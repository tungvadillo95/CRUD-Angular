using Dapper;
using Demo.DAL.Interface;
using Demo.Domain.Request.User;
using Demo.Domain.Respone.User;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Demo.DAL.Implement
{
    public class UserRepository : BaseRepository, IUserRepository
    {
        public async Task<IEnumerable<UserView>> Gets()
        {
            try
            {
                return await SqlMapper.QueryAsync<UserView>(cnn: connection,
                                                        sql: "sp_GetUsers",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<UserView> Get(int id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", id);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<UserView>(cnn: connection,
                                                                                sql: "sp_GetUser",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<SaveUserRes> Save(SaveUserReq request)
        {
            var result = new SaveUserRes()
            {
                id = 0,
                message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id", request.id);
                parameters.Add("@fullName", request.fullName);
                parameters.Add("@dob", request.dob);
                parameters.Add("@gender", request.gender);

                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveUserRes>(cnn: connection,
                                                                    sql: "sp_SaveUser",
                                                                    param: parameters,
                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch
            {
                return result;
            }
        }
    }
}
