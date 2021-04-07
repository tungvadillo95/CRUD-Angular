using Dapper;
using Demo.DAL.Interface;
using Demo.Domain.Request.Subject;
using Demo.Domain.Respone.Subject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Demo.DAL.Implement
{
    public class SubjectRepository : BaseRepository, ISubjectRepository
    {
        public async Task<IEnumerable<SubjectView>> Gets()
        {
            try
            {
                return await SqlMapper.QueryAsync<SubjectView>(cnn: connection,
                                                        sql: "sp_GetSubjects",
                                                        commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<SubjectView> Get(int id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@SubjectId", id);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<SubjectView>(cnn: connection,
                                                                                sql: "sp_GetSubject",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<SaveSubjectRes> Save(SaveSubjectReq request)
        {
            var result = new SaveSubjectRes()
            {
                SubjectId = 0,
                Message = "Đã xảy ra sự cố, vui lòng liên hệ với administrator."
            };
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@SubjectId", request.SubjectId);
                parameters.Add("@SubjectName", request.SubjectName);

                result = await SqlMapper.QueryFirstOrDefaultAsync<SaveSubjectRes>(cnn: connection,
                                                                    sql: "sp_SaveSubject",
                                                                    param: parameters,
                                                                    commandType: CommandType.StoredProcedure);
                return result;
            }
            catch
            {
                return result;
            }
        }
        public async Task<SaveSubjectRes> Deleted(int id)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@SubjectId", id);
                var result = await SqlMapper.QueryFirstOrDefaultAsync<SaveSubjectRes>(cnn: connection,
                                                                                sql: "sp_DeletedSubject",
                                                                                param: parameters,
                                                                                commandType: CommandType.StoredProcedure);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
